import pytest
from metrics.language_metrics import (
    summarization_rouge, summarization_bleu, summarization_meteor
)
from utilities.translation_utilities import (
    translate_english_to_spanish_huggingface, translate_spanish_to_english_huggingface
)

def test_simple_summary_metric():
    # simple summarization example
    starting_answer = "Earlier today, Alice went to the store to buy some groceries."
    summarized_answer = "Alice went to the store to buy some groceries yesterday."
    print(summarization_rouge(summarized_answer, starting_answer))
    print(summarization_bleu(summarized_answer, starting_answer))
    print(summarization_meteor(summarized_answer, starting_answer))

    # {'rouge1': 0.857, 'rouge2': 0.842, 'rougeL': 0.857}
    # 0.673
    # 0.733

def test_simple_translation_summary_metric():
    # lets mix things up by also translating from and back to english
    starting_answer = "Earlier today, Alice went to the store to buy some groceries."
    spanish_starting_answer = translate_english_to_spanish_huggingface(starting_answer)
    print(spanish_starting_answer)
    english_summarized_answer = translate_spanish_to_english_huggingface(spanish_starting_answer)
    print(english_summarized_answer)

    print(summarization_rouge(english_summarized_answer, starting_answer))
    print(summarization_bleu(english_summarized_answer, starting_answer))
    print(summarization_meteor(english_summarized_answer, starting_answer))

    # {'rouge1': 0.909, 'rouge2': 0.9, 'rougeL': 0.909}
    # 0.912
    # 0.909

def test_translate_long_paragraph_summary_metric():
    # longer form summarization example
    starting_paragraph = "It could not have been ten seconds, and yet it seemed a long time that their hands were clasped together.  He had time to learn every detail of her hand.  He explored the long fingers, the shapely nails, the work-hardened palm with its row of callouses, the smooth flesh under the wrist.  Merely from feeling it he would have known it by sight.  In the same instant it occurred to him that he did not know what colour the girl's eyes were.  They were probably brown, but people with dark hair sometimes had blue eyes.  To turn his head and look at her would have been inconceivable folly.  With hands locked together, invisible among the press of bodies, they stared steadily in front of them, and instead of the eyes of the girl, the eyes of the aged prisoner gazed mournfully at Winston out of nests of hair."
    spanish_paragraph = translate_english_to_spanish_huggingface(starting_paragraph)
    english_paragraph_result = translate_spanish_to_english_huggingface(spanish_paragraph)
    print(english_paragraph_result)
    print(summarization_rouge(english_paragraph_result, starting_paragraph))
    print(summarization_bleu(english_paragraph_result, starting_paragraph))
    print(summarization_meteor(english_paragraph_result, starting_paragraph))

    # {'rouge1': 0.836, 'rouge2': 0.586, 'rougeL': 0.767}
    # 0.507
    # 0.763