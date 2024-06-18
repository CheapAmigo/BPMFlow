from django.urls import path
from django.contrib.auth import views as auth_views
from .views import register, login_view, employee_dashboard, manager_dashboard, department_view, create_task, employee_profile

urlpatterns = [
    path('register/', register, name='register'),
    path('login/', login_view, name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('employee_dashboard/', employee_dashboard, name='employee_dashboard'),
    path('manager_dashboard/', manager_dashboard, name='manager_dashboard'),
    path('department/<int:department_id>/', department_view, name='department_view'),
    path('create_task/', create_task, name='create_task'),
    path('employee/<int:employee_id>/', employee_profile, name='employee_profile'),
]
