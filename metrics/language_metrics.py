from typing import List, Dict, Any
from rouge_score import rouge_scorer
import sacrebleu

import nltk
import nltk.translate.meteor_score as meteor_mod

from transformers import pipeline


# translation helper functions using Hugging Face transformers
def translate_english_to_spanish_huggingface(text: str) -> str:
    translator = pipeline("translation", model="Helsinki-NLP/opus-mt-en-es")
    translated = translator(text)
    return translated[0]['translation_text']

def translate_spanish_to_english_huggingface(text: str) -> str:
    translator = pipeline("translation", model="Helsinki-NLP/opus-mt-es-en")
    translated = translator(text)
    return translated[0]['translation_text']


# ROUGE scores

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

# BLEU scores

# scores a single sentence
def summarization_bleu(predicted_answer: str, expected_answer: str) -> float:
    result = sacrebleu.sentence_bleu(predicted_answer, [expected_answer])
    return round(result.score / 100, 3)

# scores a corpus (LIST) of sentences
def summarization_bleu_corpus(predicted_answers: List[str], expected_answers: List[str]) -> float:
    result = sacrebleu.corpus_bleu(predicted_answers, [expected_answers])
    return round(result.score / 100, 3)

# METEOR (NLTK) scores

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



# TESTING - probably should make a more robust test suite for each metric category
if __name__ == "__main__":
    # simple summarization example
    starting_answer = "Earlier today, Alice went to the store to buy some groceries."
    summarized_answer = "Alice went to the store to buy some groceries yesterday."
    print(summarization_rouge(summarized_answer, starting_answer))
    print(summarization_bleu(summarized_answer, starting_answer))
    print(summarization_meteor(summarized_answer, starting_answer))

    # longer form summarization example
    # lets mix things up by also translating from and back to english
    spanish_starting_answer = translate_english_to_spanish_huggingface(starting_answer)
    print(spanish_starting_answer)
    english_summarized_answer = translate_spanish_to_english_huggingface(spanish_starting_answer)
    print(english_summarized_answer)

    print(summarization_rouge(english_summarized_answer, starting_answer))
    print(summarization_bleu(english_summarized_answer, starting_answer))
    print(summarization_meteor(english_summarized_answer, starting_answer))