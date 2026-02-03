import numpy as np
from typing import Optional, List
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity


def simple_correctness(predicted_answer, expected_answer):
    return 0 if predicted_answer == expected_answer else 1

def simple_distance_vector(predicted_answer, expected_answer):
    return np.linalg.norm(predicted_answer - expected_answer)


# Vector embedding similarity metrics for LaTeX math proofs

# Global model cache to avoid reloading
_embedding_model: Optional[SentenceTransformer] = None

def _get_embedding_model(model_name: str = "all-MiniLM-L6-v2") -> SentenceTransformer:
    """Get or load the embedding model (cached for efficiency)."""
    global _embedding_model
    if _embedding_model is None:
        _embedding_model = SentenceTransformer(model_name)
    return _embedding_model


def proof_embedding_similarity(
    predicted_proof: str, 
    expected_proof: str, 
    model_name: str = "all-MiniLM-L6-v2"
) -> float:
    """
    Compute cosine similarity between two LaTeX math proofs using sentence embeddings.
    
    Args:
        predicted_proof: The predicted LaTeX proof text
        expected_proof: The expected/reference LaTeX proof text
        model_name: Name of the sentence transformer model to use
                   Options: "all-MiniLM-L6-v2" (fast, general purpose),
                           "all-mpnet-base-v2" (slower, higher quality),
                           "sentence-transformers/all-MiniLM-L12-v2" (balanced)
    
    Returns:
        Cosine similarity score between 0 and 1 (1 = identical, 0 = completely different)
    """
    model = _get_embedding_model(model_name)
    
    # Get embeddings for both proofs
    embeddings = model.encode([predicted_proof, expected_proof])
    
    # Compute cosine similarity
    similarity = cosine_similarity([embeddings[0]], [embeddings[1]])[0][0]
    
    return round(float(similarity), 4)


def proof_embedding_similarity_batch(
    predicted_proofs: List[str], 
    expected_proofs: List[str],
    model_name: str = "all-MiniLM-L6-v2"
) -> List[float]:
    """
    Compute cosine similarity for multiple proof pairs in batch (more efficient).
    
    Args:
        predicted_proofs: List of predicted LaTeX proof texts
        expected_proofs: List of expected/reference LaTeX proof texts
        model_name: Name of the sentence transformer model to use
    
    Returns:
        List of cosine similarity scores
    """
    if len(predicted_proofs) != len(expected_proofs):
        raise ValueError("predicted_proofs and expected_proofs must have the same length")
    
    model = _get_embedding_model(model_name)
    
    # Combine all texts for batch encoding
    all_texts = predicted_proofs + expected_proofs
    embeddings = model.encode(all_texts)
    
    # Split embeddings
    n = len(predicted_proofs)
    pred_embeddings = embeddings[:n]
    exp_embeddings = embeddings[n:]
    
    # Compute pairwise cosine similarities
    similarities = [
        round(float(cosine_similarity([pred], [exp])[0][0]), 4)
        for pred, exp in zip(pred_embeddings, exp_embeddings)
    ]
    
    return similarities

