from rest_framework import generics
from rest_framework import response
from projects.serializers import DemoSerializer
from projects.models import Demo


class RetriveUDView(generics.ListCreateAPIView):
    queryset = Demo.objects.all()
    serializer_class = DemoSerializer

class RetriveUDApiView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Demo.objects.all()
    serializer_class = DemoSerializer
    lookup_field = 'id'
