from django.contrib.auth.models import AbstractUser
from django.db import models
from django.contrib.auth import get_user_model

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
    position = models.CharField(max_length=100, blank=True, null=True)
    responsibilities = models.TextField(blank=True, null=True)
    sick_leave = models.BooleanField(default=False, verbose_name='На больничном')
    leave_of_absence = models.BooleanField(default=False, verbose_name='Прогул')

    def __str__(self):
        return f'{self.username} ({self.get_role_display()})'

CustomUser = get_user_model()

class Task(models.Model):
    STATUS_CHOICES = [
        ('pending', 'Ожидание'),
        ('in_progress', 'В работе'),
        ('completed', 'Завершено'),
        ('under_review', 'На проверке'),
        ('rejected', 'Отклонено'),
        ('accepted', 'Принято'),
    ]

    TIME_CHOICES = [
        ('work_time', 'Рабочее время'),
        ('after_hours', 'Дополнительная работа'),
    ]

    title = models.CharField(max_length=100)
    description = models.TextField()
    assigned_to = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='tasks')
    due_date = models.DateField()
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    review_comment = models.TextField(blank=True, null=True)
    is_completed = models.BooleanField(default=False)
    completion_date = models.DateField(null=True, blank=True)
    time_period = models.CharField(max_length=20, choices=[('work_time', 'Рабочее время'), ('after_hours', 'Послерабочее время'), ('weekend_hours', 'Выходной день')], default='work_time')
    
    def __str__(self):
        return self.title
    
    
class Schedule(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='schedules')
    day = models.DateField()
    tasks = models.ManyToManyField(Task, related_name='schedules')
    sick_leave = models.BooleanField(default=False)
    leave_of_absence = models.BooleanField(default=False)
    
    class Meta:
        unique_together = ('user', 'day')  # Уникальное ограничение для user и day

    def __str__(self):
        return f'Schedule for {self.user.username} on {self.day}'