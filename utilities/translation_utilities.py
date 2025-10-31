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