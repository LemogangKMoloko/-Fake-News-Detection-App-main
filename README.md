Fake News Detection App (Flutter + Django)
 
A full-stack machine learning application that detects whether a news article is Real or Fake. Built using Flutter for the mobile frontend and Django with a scikit-learn model for the backend API.
Features
•	Flutter Frontend: Clean mobile UI where users input news text to get predictions.
•	ML Model (Backend): Trained using `SGDClassifier` with `TF-IDF` vectorization on a dataset of labeled fake and real news.
•	REST API: Django REST Framework exposes an endpoint `/api/predict/` that receives a POST request and returns the model prediction.
•	Preprocessing: Includes HTML tag removal, stemming, stopword removal, lowercasing, and tokenization.
•	Accurate Predictions: 93.7% test accuracy on validation data. 
 
---
 
Model Performance
 
| Metric      | Score     |
|-------------|-----------|
| Accuracy    | 93.7%     |
| Precision   | 94.1%     |
| Recall      | 93.2%     |
| F1-Score    | 93.7%     |
 
Model trained and validated using `scikit-learn` on a cleaned fake-news dataset.
 
Tech Stack
Frontend
- [Flutter](https://flutter.dev/)  
- Dart  
- HTTP package  
 
Backend
- [Python](https://www.python.org/)
- [Django](https://www.djangoproject.com/)
- [Django REST Framework](https://www.django-rest-framework.org/)
- [scikit-learn](https://scikit-learn.org/)
- [Pandas](https://pandas.pydata.org/)
- [NLTK](https://www.nltk.org/)

 Future Improvements
•	 Deploy backend to a cloud server (e.g., Heroku, Railway, Render)
•	Replace current model with Deep Learning models like LSTM or BERT
•	Integrate web scraping to fetch and classify real-time news
•	Enable real-time model re-training with new data

How It Works
•	User enters news text in the Flutter app.
•	Flutter sends a POST request to the Django REST API. 
•	The backend cleans the text and feeds it to a trained ML model.
•	The model returns a prediction: REAL or FAKE.
•	The result is displayed in the mobile app UI.

This project is for educational and portfolio use.

API Usage

**POST** `/api/predict/`  
```json
{
  "text": "Your news article goes here"
}
![Uploading image.png…]()





