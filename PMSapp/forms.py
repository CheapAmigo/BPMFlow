import re
from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import CustomUser, Department, Task

class CustomUserCreationForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=True, help_text='Обязательное поле.')
    last_name = forms.CharField(max_length=30, required=True, help_text='Обязательное поле.')
    patronymic = forms.CharField(max_length=30, required=True, help_text='Обязательное поле.')
    phone_number = forms.CharField(max_length=15, required=True, help_text='Обязательное поле.')
    passport_data = forms.CharField(max_length=100, required=True, help_text='Обязательное поле.')
    department = forms.ModelChoiceField(queryset=Department.objects.all(), required=True, help_text='Обязательное поле.')
    position = forms.CharField(max_length=100, required=False, label='Должность', widget=forms.TextInput(attrs={'class': 'form-control', 'readonly': 'readonly'}))
    responsibilities = forms.CharField(required=False, label='Должностные обязанности', help_text='Пишите аккуратно', widget=forms.Textarea(attrs={'class': 'form-control', 'readonly': 'readonly'}))

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['position'].widget.attrs['readonly'] = True
        self.fields['responsibilities'].widget.attrs['readonly'] = True

    class Meta(UserCreationForm.Meta):
        model = CustomUser
        fields = ('username', 'first_name', 'last_name', 'patronymic', 'phone_number', 'passport_data', 'department', 'role', 'position', 'responsibilities', 'password1', 'password2')

    def clean_username(self):
        username = self.cleaned_data.get('username')
        if not re.match(r'^[\w.@+-]+$', username):
            raise forms.ValidationError('Имя пользователя может содержать только буквы, цифры и @/./+/-/_. Пробелы недопустимы.')
        return username

    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError('Пароли не совпадают.')
        if password2 and (len(password2) < 8 or password2.isdigit() or password2 == password2.lower()):
            raise forms.ValidationError('Ваш пароль должен содержать не менее 8 символов, не быть полностью цифровым, строчным или похожим на другие личные данные и не быть регулярным паролем.')
        return password2

class CustomAuthenticationForm(AuthenticationForm):
    username = forms.CharField(max_length=254, required=True, help_text='Обязательное поле.')
    password = forms.CharField(label="Пароль", strip=False, widget=forms.PasswordInput, required=True, help_text='Обязательное поле.')

class TaskForm(forms.ModelForm):
    class Meta:
        model = Task
        fields = ['title', 'description', 'due_date', 'assigned_to']

class AbsenceForm(forms.ModelForm):
    class Meta:
        model = CustomUser
        fields = ['sick_leave', 'leave_of_absence']
        widgets = {
            'sick_leave': forms.CheckboxInput(),
            'leave_of_absence': forms.CheckboxInput(),
        }
