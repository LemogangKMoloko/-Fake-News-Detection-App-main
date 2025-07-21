import re
import string
import nltk
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from functools import lru_cache

nltk.download('stopwords')

STOP_WORDS = set(stopwords.words('english'))
stemmer = PorterStemmer()
REGEX_PATTERN = re.compile('[^a-zA-Z]')

def clean(text):
    text = re.sub(r'<.*?>', '', text)
    text = re.sub(r'http[s]?://\S+', '', text)
    text = re.sub(r'\b[\w.-]+@[\w.-]+\.\w{2,}\b', '', text)
    text = re.sub(r'\d+', '', text)
    text = re.sub(r'[`\u2013\u2026\\—]', '', text)
    text = re.sub('[%s]' % re.escape(string.punctuation), '', text)
    text = text.replace('’', ' ').replace("'", ' ').replace('‘',' ')
    text = re.sub(r'\s+', ' ', text)
    return text

@lru_cache(maxsize=10000)
def cached_stem(word):
    return stemmer.stem(word)

def stemming(content):
    stemmed_content = REGEX_PATTERN.sub(' ', content)
    stemmed_content = stemmed_content.lower()
    stemmed_content = [cached_stem(word) for word in stemmed_content.split() if word not in STOP_WORDS]
    return ' '.join(stemmed_content)

def preprocess_pipeline(text):
    return stemming(clean(text))
