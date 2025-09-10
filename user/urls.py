from django.urls import path,include
from .views import RegisterUserAPIView,check_email,login_user
from rest_framework.routers import DefaultRouter

app_name = 'user'

urlpatterns = [
    path('register/',RegisterUserAPIView.as_view()),
    path('email-exist/',check_email,name='email-exist'),
    path('user-login/',login_user,name='user-login')
]
