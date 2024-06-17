from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import CustomUser, Department

class CustomUserCreationForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=True, help_text='Обязательное поле.')
    last_name = forms.CharField(max_length=30, required=True, help_text='Обязательное поле.')
    patronymic = forms.CharField(max_length=30, required=True, help_text='Обязательное поле.')
    phone_number = forms.CharField(max_length=15, required=True, help_text='Обязательное поле.')
    passport_data = forms.CharField(max_length=100, required=True, help_text='Обязательное поле.')
    department = forms.ModelChoiceField(queryset=Department.objects.all(), required=True, help_text='Обязательное поле.')

    class Meta(UserCreationForm.Meta):
        model = CustomUser
        fields = ('username', 'first_name', 'last_name', 'patronymic', 'phone_number', 'passport_data', 'department', 'role', 'password1', 'password2')

class CustomAuthenticationForm(AuthenticationForm):
    username = forms.CharField(max_length=254, required=True, help_text='Обязательное поле.')
    password = forms.CharField(label="Пароль", strip=False, widget=forms.PasswordInput, required=True, help_text='Обязательное поле.')
