from rest_framework import serializers
from .models import Product
from user.serializers import UserSerializer

class ProductSerializer(serializers.ModelSerializer):
    user_id = serializers.IntegerField(write_only=True)
    user = UserSerializer(read_only=True)

    class Meta:
        model = Product
        fields = [
            'id', 'category', 'image', 'description', 'price',
            'original_price', 'discount', 'user_id', 'user'
        ]
        read_only_fields = ['id', 'user']

class ProductDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ProductSerializer.Meta.fields
        read_only_fields = ['id']

class ProductImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['id', 'image']
        read_only_fields = ['id']
