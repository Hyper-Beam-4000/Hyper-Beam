#!/bin/bash
# EC2 setup script for Hyper Beam — run this on the Ubuntu instance after scp-ing the project.
#
# Usage:
#   1. On your laptop, copy the project and .env to EC2:
#        scp -i ~/Downloads/your-key.pem -r ~/Downloads/CIS-4000 ubuntu@<ec2-dns>:~/CIS-4000
#        scp -i ~/Downloads/your-key.pem ~/Downloads/CIS-4000/backend/.env ubuntu@<ec2-dns>:~/CIS-4000/backend/.env
#
#   2. SSH into EC2 and run this script:
#        ssh -i ~/Downloads/your-key.pem ubuntu@<ec2-dns>
#        cd ~/CIS-4000 && bash ec2_setup.sh

set -e

echo "=== [1/4] Installing system dependencies ==="
sudo apt update && sudo apt install -y python3-pip python3-venv git

echo "=== [2/4] Creating venv and installing Python deps ==="
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

echo "=== [3/4] Registering systemd services ==="

sudo tee /etc/systemd/system/hyperbeam-api.service > /dev/null <<EOF
[Unit]
Description=Hyper Beam API
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/home/ubuntu/CIS-4000
ExecStart=/home/ubuntu/CIS-4000/.venv/bin/uvicorn backend.main:app --host 0.0.0.0 --port 8000
Restart=always
RestartSec=10
EnvironmentFile=/home/ubuntu/CIS-4000/backend/.env

[Install]
WantedBy=multi-user.target
EOF

sudo tee /etc/systemd/system/hyperbeam-worker.service > /dev/null <<EOF
[Unit]
Description=Hyper Beam Evaluation Worker
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/home/ubuntu/CIS-4000
ExecStart=/home/ubuntu/CIS-4000/.venv/bin/python backend/scripts/worker.py --queue score
Restart=always
RestartSec=10
EnvironmentFile=/home/ubuntu/CIS-4000/backend/.env

[Install]
WantedBy=multi-user.target
EOF

echo "=== [4/4] Starting services ==="
sudo systemctl daemon-reload
sudo systemctl enable hyperbeam-api hyperbeam-worker
sudo systemctl start hyperbeam-api hyperbeam-worker

echo ""
echo "=== Done! ==="
echo "API:    http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):8000"
echo ""
echo "Check status:    sudo systemctl status hyperbeam-api hyperbeam-worker"
echo "Live API logs:   sudo journalctl -u hyperbeam-api -f"
echo "Live worker logs: sudo journalctl -u hyperbeam-worker -f"
echo ""
echo "NOTE: Open port 8000 in your EC2 security group (Inbound: TCP 8000)"
echo "      then use http://<ec2-public-ip>:8000/api/gemini-proxy as your endpoint URL."
