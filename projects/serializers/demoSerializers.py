from rest_framework import serializers
from projects.models import Demo


class DemoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Demo
        fields = '__all__'
