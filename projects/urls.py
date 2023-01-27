from django.urls import path
from projects.views import RetriveUDView,RetriveUDApiView

urlpatterns = [
    path('demo/crud/', RetriveUDView.as_view(), name="creacion_demo"),
    path('demo/crud/<int:id>/', RetriveUDApiView.as_view(), name="update_demo"),
]
