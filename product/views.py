from django.shortcuts import render
from .models import Product
from rest_framework.viewsets import ModelViewSet
from .serializers import ProductSerializer,ProductDataSerializer,ProductImageSerializer
from rest_framework.response import Response
from rest_framework.exceptions import APIException
from rest_framework import status,parsers
from rest_framework.decorators import action


# Create your views here.
class ProductViewSet(ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductDataSerializer 
    parser_classes = (parsers.FormParser,parsers.MultiPartParser,parsers.FileUploadParser)
    
    def get_serializer_class(self):
        if self.action == 'list':
            return ProductSerializer
        if self.action == 'create':
            return ProductSerializer
        elif self.action == 'upload_image':
            return ProductImageSerializer
        return self.serializer_class
            
    @action(methods=['POST'],detail=True,url_path='upload-image')
    def upload_image(self,request,pk=None):
            product_objs = self.get_object()
            serializer = self.get_serializer(product_objs,data=request.data)

            if not serializer.is_valid():
                return Response({
                    'status':status.HTTP_400_BAD_REQUEST,
                    'message' : 'Invalid data'
                })
            serializer.save()
            return Response({
                'status':status.HTTP_200_OK,
                'data':serializer.data,
                'message':'Image Uploaded successfully'
            })

        
    # Get all author list
    def list(self,request):
        try:
            product_objs = Product.objects.all()
            serializer = self.get_serializer(product_objs,many=True)
            return Response({
                'status':status.HTTP_200_OK,
                'data':serializer.data
            })
        except Exception as e:
            raise APIException({     
                'message':APIException.default_detail,
                'status':APIException.status_code
            })

    # Add new author 
    def create(self,request):
        try:
            serializer = self.get_serializer(data=request.data)
            if not serializer.is_valid():
                return Response({
                'status':status.HTTP_400_BAD_REQUEST,
                'message':'Invalid Data'
            })
            serializer.save()
            return Response({
                'status':status.HTTP_201_CREATED,
                'data':serializer.data,
                'message':'Product added successfully'
            })
        except Exception as e:
            raise APIException({
                'message':APIException.default_detail,
                'status':APIException.status_code
            })
        
    def retrieve(self,request,pk):
        try:
            id=pk
            if id is not None:
              product_objs = self.get_object()
              serializer = self.get_serializer(product_objs)
            return Response({
                'status':status.HTTP_200_OK,
                'data':serializer.data
            })
        except Exception as e:
            raise APIException({
                'message':APIException.default_detail,
                'status':APIException.status_code
            })

    def update(self,request,pk=None):
        try:
            product_objs = self.get_object()
            serializer = self.get_serializer(product_objs,data=request.data,partial=False)
            if not serializer.is_valid():
                return Response({
                    'status':status.HTTP_400_BAD_REQUEST,
                    'message':'Invalid Data'
                })
            serializer.save()
            return Response({
                'status':status.HTTP_201_CREATED,
                'data':serializer.data,
                'message':'Author updated successfully',
            })
        except Exception as e:
            raise APIException({
                'message':APIException.default_detail,
                'status':APIException.status_code
            })
        
    def partial_update(self, request,pk=None):
        try:
            product_objs = self.get_object()
            serializer = self.get_serializer(product_objs,data=request.data,partial=True)
            if not serializer.is_valid():
                return Response({
                    'status':status.HTTP_400_BAD_REQUEST,
                    'message':'Invalid Data'
                })
            serializer.save()
            return Response({
                'status':status.HTTP_201_CREATED,
                'data':serializer.data,
                'message':'Author partially updated successfully'
            })
        except Exception as e:
            raise APIException({
                'message':APIException.default_detail,
                'status':APIException.status_code
            })

    # Delete specific author by id 
    def destroy(self,request,pk):
        try:
            id=pk
            product_objs = self.get_object()
            product_objs.delete()
            return Response({
                'status':status.HTTP_200_OK,
                'message':'Author deleted successfully'
            })
        
        except Exception as e:
            raise APIException({
                'message':APIException.default_detail,
                'status':APIException.status_code
            })
        