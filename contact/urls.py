from django.urls import path
from .views import ContactAPIView

app_name = 'contact'

urlpatterns = [
    path('register',ContactAPIView.as_view()),
]
