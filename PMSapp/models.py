from django.contrib.auth.models import AbstractUser
from django.db import models

class Department(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name

class CustomUser(AbstractUser):
    ROLES = (
        ('employee', 'Работник'),
        ('manager', 'Менеджер'),
    )
    
    role = models.CharField(max_length=10, choices=ROLES)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    patronymic = models.CharField(max_length=30)
    phone_number = models.CharField(max_length=15)
    passport_data = models.CharField(max_length=100)
    department = models.ForeignKey(Department, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return f'{self.username} ({self.get_role_display()})'
