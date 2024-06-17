from django.urls import path
from django.contrib.auth import views as auth_views
from .views import register, login_view
from django.views.generic import TemplateView

urlpatterns = [
    path('register/', register, name='register'),
    path('login/', login_view, name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('login/employee_dashboard.html', TemplateView.as_view(template_name='employee_dashboard.html'), name='employee_dashboard'),
    path('login/manager_dashboard.html', TemplateView.as_view(template_name='manager_dashboard.html'), name='manager_dashboard'),
]
