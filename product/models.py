from django.db import models
# from django.contrib.auth import CustomUser
from user.models import CustomUser
# CustomUser = get_user_model()

def product_image_file_path(instance,filename):
    return '/'.join([str(instance.category),filename])

class Product(models.Model):
    CATEGORY_CHOICES = [
        ('lipstick', 'Lipstick'),
        ('foundation', 'Foundation'),
        ('eyeshadow', 'Eye Shadow'),
        ('blush', 'Blush'),
    ]
    category = models.CharField(max_length=50, choices=CATEGORY_CHOICES)
    image = models.ImageField(upload_to=product_image_file_path)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    original_price = models.DecimalField(max_digits=10, decimal_places=2)
    discount = models.IntegerField()
    user = models.ForeignKey('user.Customuser', on_delete=models.CASCADE, related_name='products')

