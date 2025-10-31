def simple_correctness(predicted_answer, expected_answer):
    return (predicted_answer == expected_answer ? 0 : 1)

def simple_distance_vector(predicted_answer, expected_answer):
    return np.linalg.norm(predicted_answer - expected_answer)

