from django.db import models

class Demo(models.Model):
    title = models.CharField(max_length=200)
    descripcion = models.TextField()
    tecnology = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now=True)
