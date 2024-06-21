from django.urls import path
from django.contrib.auth import views as auth_views
from . import views
from .views import register, login_view, employee_dashboard, manager_dashboard, department_view, create_task, weekly_schedule, daily_schedule, manage_absence, submit_task_for_review, review_task

urlpatterns = [
    path('register/', register, name='register'),
    path('login/', login_view, name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='login'), name='logout'),
    path('employee_dashboard/', employee_dashboard, name='employee_dashboard'),
    path('employee_dashboard/<int:employee_id>/', employee_dashboard, name='employee_dashboard'),
    path('manager_dashboard/', manager_dashboard, name='manager_dashboard'),
    path('department/<int:department_id>/', department_view, name='department_view'),
    path('create_task/', create_task, name='create_task'),
    path('submit_task_for_review/<int:task_id>/', views.submit_task_for_review, name='submit_task_for_review'),
    path('task/<int:task_id>/review/', review_task, name='review_task'),
    path('review_tasks/', views.review_tasks, name='review_tasks'),
    path('daily_schedule/<str:date>/', views.daily_schedule, name='daily_schedule'),
    path('daily_schedule/<str:date>/<int:employee_id>/', views.daily_schedule, name='daily_schedule_employee'),
    path('weekly_schedule/', views.weekly_schedule, name='weekly_schedule'),
    path('weekly_schedule/<int:employee_id>/', views.weekly_schedule, name='weekly_schedule_employee'),
    path('manage_absence/<int:user_id>/', manage_absence, name='manage_absence'),
]
