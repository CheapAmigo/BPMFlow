from django.contrib.auth.models import AbstractUser
from django.db import models

class Department(models.Model):
    name = models.CharField(max_length=100, unique=True)
    description = models.TextField(blank=True, null=True)

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
    position = models.CharField(max_length=100, blank=True, null=True)  # Новое поле для должности
    responsibilities = models.TextField(blank=True, null=True)  # Новое поле для обязанностей

    def __str__(self):
        return f'{self.username} ({self.get_role_display()})'

class Task(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    assigned_to = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='tasks')
    due_date = models.DateField()
    is_completed = models.BooleanField(default=False)
    completion_date = models.DateField(null=True, blank=True)
    
    def __str__(self):
        return self.title

class Schedule(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE, related_name='schedule')
    day = models.DateField()
    tasks = models.ManyToManyField(Task, related_name='schedules')
    
    def __str__(self):
        return f'Schedule for {self.user.username} on {self.day}'
