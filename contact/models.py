from django.db import models

# Create your models here.

class ContactData(models.Model):
    fullname = models.CharField(max_length=255)
    email = models.EmailField()
    contact = models.CharField(max_length=20)
    subject = models.TextField()
    message = models.TextField()
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.fullname} - {self.email}"
