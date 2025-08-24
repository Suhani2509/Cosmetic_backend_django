from django.shortcuts import render
from .serializers import ContactDataSerializer
from rest_framework import generics,status
from rest_framework.views import APIView
from rest_framework.response import Response
from drf_yasg.utils import swagger_auto_schema

# Create your views here.

class ContactAPIView(APIView):
    serializer_class = ContactDataSerializer

    @swagger_auto_schema(
        request_body=ContactDataSerializer,
        query_serializer=ContactDataSerializer,
        security=[],
    )
    def post(self,request):
        serializer = ContactDataSerializer(data=request.data)

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
            'data':serializer.data,
        })
    
class ManageUserView(generics.RetrieveUpdateAPIView):
        serializer_class= ContactDataSerializer
        def get_object(self):
            return self.request.user
        
        def get(self,*args):
            user_obj = self.get_object()
            serializer = ContactDataSerializer(user_obj)

            return Response({
                'status':status.HTTP_200_OK,
                'data':serializer.data
            })
        
        # update data partially
        def patch(self,request):
            user_obj = self.get_object()
            serializer = ContactDataSerializer(user_obj,data=request.data,partial = True)

            if not serializer.is_valid():
                return Response({
                    'status':status.HTTP_400_BAD_REQUEST,
                    'error':serializer.errors,
                    'message':'Invalid data'
                })
            serializer.save()
            return Response({
                'status':status.HTTP_200_OK,
                'message':'User partially updated successfully'
            })
        
        # update data completely
        def put(self,request):
            user_obj = self.get_object()
            serializer = ContactDataSerializer(user_obj,data=request.data,partial = False)

            if not serializer.is_valid():
                return Response({
                    'status':status.HTTP_400_BAD_REQUEST,
                    'error':serializer.errors,
                    'message':'Invalid data'
                })
            serializer.save()
            return Response({
                'status':status.HTTP_200_OK,
                'message':'User Completely updated successfully'
            })
        