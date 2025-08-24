from rest_framework import serializers
from django.contrib.auth import get_user_model
from rest_framework.validators import UniqueValidator
CustomUser = get_user_model()


# user models is already ready made provided by django
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields =  ['id', 'username', 'email', 'contact', 'password', 'address', 'gender', 'is_superuser']
        extra_kwargs = {
            'password': {'write_only': True},
            'id': {'read_only': True},
        }


class RegisterSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
        required = True,
        # matches from the list and see for unique value
        validators = [UniqueValidator(queryset = CustomUser.objects.all())]
    )
    password = serializers.CharField(
        write_only = True,
        required = True,
        min_length = 6
    )
   
    class Meta:
        model = CustomUser
        fields = ['id', 'username', 'email', 'contact', 'password', 'address', 'gender', 'is_superuser']
        extra_kwargs = {
            'email' :{'required':True}
        }
    
    def create(self, validated_data):
        user = CustomUser(
            username=validated_data['username'],
            email=validated_data['email'],
            contact=validated_data.get('contact', ''),
            address=validated_data.get('address', ''),
            gender=validated_data.get('gender', ''),
            is_superuser=validated_data.get('is_superuser', False)
        )
        user.set_password(validated_data['password'])
        user.save()
        return user

