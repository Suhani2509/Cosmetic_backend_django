from django.shortcuts import render
from .serializers import RegisterSerializer,UserSerializer
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from drf_yasg.utils import swagger_auto_schema
from rest_framework.decorators import api_view
from rest_framework.exceptions import APIException
from django.contrib.auth import get_user_model
User = get_user_model()

# Create your views here.

class RegisterUserAPIView(APIView):
    serializer_class = RegisterSerializer

    @swagger_auto_schema(
        request_body=RegisterSerializer,
        query_serializer=RegisterSerializer,
        security=[],
    )
    def post(self,request):
        serializer = RegisterSerializer(data=request.data)

        if not serializer.is_valid():
            print(serializer.errors)
            return Response({
                'status':status.HTTP_400_BAD_REQUEST,
                'errors':serializer.errors,
                'message': 'Invalid data'
            })
        serializer.save()
        return Response({
            'status':status.HTTP_200_OK,
            'data':serializer.data
        })
    
@api_view(['GET'])
def check_email(request):
    email = request.GET.get('email')
    exists = User.objects.filter(email=email).exists()
    return Response({"exists": exists})

@api_view(['POST'])
def login_user(request):
    email = request.data.get('email')
    password = request.data.get('password')
    try:
        user = User.objects.get(email=email)
    except User.DoesNotExist:
        return Response({'error':'Invalid email or password'},status=400)
    
    if user.check_password(password):
        return Response({
            'id':user.id,
            'email':user.email,
            },status=200)
    else:
        return Response({'error':'Invalid email or password'},status=400)