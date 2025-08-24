"""Preetycosmetic URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from django.conf.urls.static import static
from django.conf import settings
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
   openapi.Info(
      title="Preety Cosmetic API",
      default_version='v1',
      description="Cosmetic Operations Performing",
      terms_of_service="http://127.0.0.1:8000/",
      contact=openapi.Contact(email="suhani2509@gmail.com"),
      
      license=openapi.License(name="BSD License"),
   ),
   public=True,
#    permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('user/', include('user.urls')),
    path('product/',include('product.urls')),
    path('contact/',include('contact.urls'))

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)

