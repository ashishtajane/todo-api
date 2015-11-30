from django.conf.urls import url, include
from rest_framework.routers import DefaultRouter

from .views import ItemViewSet


router = DefaultRouter()
router.register(r'items', ItemViewSet, 'items')

urlpatterns = [
    url(r'^api/', include(router.urls))
]