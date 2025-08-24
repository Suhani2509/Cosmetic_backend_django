from rest_framework import serializers
from .models import ContactData

class ContactDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContactData
        fields = '__all__'
