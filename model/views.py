from django.shortcuts import render

# Create your views here.
import pickle
import os
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.conf import settings

# Load model and vectorizer
model_path = os.path.join(settings.BASE_DIR, "C:/Users/User/Documents/DataScience/FakenewsDetection/sgd_model.pkl")
vec_path = os.path.join(settings.BASE_DIR, "C:/Users/User/Documents/DataScience/FakenewsDetection/tfidf_vectorizer.pkl")

with open(model_path, 'rb') as f:
    model = pickle.load(f)

with open(vec_path, 'rb') as f:
    vectorizer = pickle.load(f)

# Optional: import label encoder if needed
@api_view(['POST',"GET"])
def predict_news(request):
    text = request.data.get("text")
    if not text:
        return Response({"error": "No text provided."}, status=400)

    from .preprocessing import preprocess_pipeline  # use your own preprocessing
    cleaned = preprocess_pipeline(text)
    transformed = vectorizer.transform([cleaned])
    prediction = model.predict(transformed)
    label = int(prediction[0])  # or decode with LabelEncoder

    return Response({"label": label})
