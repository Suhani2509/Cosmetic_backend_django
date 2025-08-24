from django.urls import path
from .views import RegisterUserAPIView,check_email

app_name = 'user'

urlpatterns = [
    path('register/',RegisterUserAPIView.as_view()),
    path('email-exist/',check_email,name='email-exist')
]
