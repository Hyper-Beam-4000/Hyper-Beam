from typing import List, Dict, Any
from rouge_score import rouge_scorer
import sacrebleu
import nltk
import nltk.translate.meteor_score as meteor_mod
from transformers import pipeline

from utilities.translation_utilities import (
    translate_english_to_spanish_huggingface,
    translate_spanish_to_english_huggingface,
)


# ROUGE scores ––––––––––––––

# returnes f1 score for a given rouge metric
def summarization_rouge_metric(predicted_answer: str, expected_answer: str, metric: str) -> float:
    scorer = rouge_scorer.RougeScorer([metric], use_stemmer=True)
    scores = scorer.score(expected_answer, predicted_answer)
    result = round(scores[metric].fmeasure, 3)
    return result

# returns f1 scores for all rouge metrics
def summarization_rouge(predicted_answer: str, expected_answer: str) -> Dict[str, float]:
    scorer = rouge_scorer.RougeScorer(["rouge1", "rouge2", "rougeL"], use_stemmer=True)
    scores = scorer.score(expected_answer, predicted_answer)
    return {k: round(v.fmeasure, 3) for k, v in scores.items()}


# BLEU scores –––––––––––––

# scores a single sentence
def summarization_bleu(predicted_answer: str, expected_answer: str) -> float:
    result = sacrebleu.sentence_bleu(predicted_answer, [expected_answer])
    return round(result.score / 100, 3)

# scores a corpus (LIST) of sentences
def summarization_bleu_corpus(predicted_answers: List[str], expected_answers: List[str]) -> float:
    result = sacrebleu.corpus_bleu(predicted_answers, [expected_answers])
    return round(result.score / 100, 3)


# METEOR (NLTK) scores –––––––––––––

# tokenize a string for meteor
def _tok(s: str):
    try:
        return nltk.word_tokenize(s) # needs punkt tokenizer
    except LookupError:
        return s.split()

# scores a single sentence using NLTK's Meteor score and tokenizer, as well as the wordnet for synonyms
def summarization_meteor(predicted_answer: str, expected_answer: str) -> float:
    hyp = _tok(predicted_answer)
    ref = _tok(expected_answer)
    result = round(meteor_mod.meteor_score([ref], hyp), 3)
    return result
