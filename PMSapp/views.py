from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, authenticate
from django.contrib.auth.decorators import login_required
from .forms import CustomUserCreationForm, CustomAuthenticationForm, AbsenceForm
from .models import CustomUser, Task, Department, Schedule
from django.http import HttpResponseForbidden
from datetime import datetime, timedelta

def register(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            if user.role == 'employee':
                return redirect('employee_dashboard')
            elif user.role == 'manager':
                return redirect('manager_dashboard')
    else:
        form = CustomUserCreationForm()
    return render(request, 'registration/register.html', {'form': form})

def login_view(request):
    if request.method == 'POST':
        form = CustomAuthenticationForm(data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                if user.role == 'employee':
                    return redirect('employee_dashboard')
                elif user.role == 'manager':
                    return redirect('manager_dashboard')
    else:
        form = CustomAuthenticationForm()
    return render(request, 'registration/login.html', {'form': form})

@login_required
def employee_dashboard(request, employee_id=None):
    if employee_id is None:
        employee = request.user
    else:
        employee = get_object_or_404(CustomUser, id=employee_id)
        if request.user.role != 'manager' and request.user != employee:
            return HttpResponseForbidden()

    tasks = Task.objects.filter(assigned_to=employee)
    current_tasks = tasks.filter(status__in=['in_progress', 'pending'])
    tasks_under_review = tasks.filter(status='under_review')
    completed_tasks = tasks.filter(status='accepted')
    rejected_tasks = tasks.filter(status='rejected')
    today = datetime.today().strftime('%Y-%m-%d')

    is_owner = request.user == employee

    return render(request, 'employee_dashboard.html', {
        'current_tasks': current_tasks,
        'tasks_under_review': tasks_under_review,
        'completed_tasks': completed_tasks,
        'rejected_tasks': rejected_tasks,
        'today': today,
        'employee': employee,
        'is_owner': is_owner
    })

@login_required
def manager_dashboard(request):
    if request.user.role != 'manager':
        return HttpResponseForbidden()
    
    department = request.user.department
    employees = CustomUser.objects.filter(department=department, role='employee')
    review_tasks = Task.objects.filter(assigned_to__department=department, status='under_review')
    today = datetime.today().strftime('%Y-%m-%d')
    
    return render(request, 'manager_dashboard.html', {
        'employees': employees, 
        'review_tasks': review_tasks,
        'today': today
    })

@login_required
def department_view(request, department_id):
    if request.user.role != 'manager':
        return HttpResponseForbidden()
    department = Department.objects.get(id=department_id)
    employees = CustomUser.objects.filter(department=department, role='employee')
    return render(request, 'department_view.html', {'department': department, 'employees': employees})

def employee_profile(request, employee_id):
    employee = get_object_or_404(CustomUser, id=employee_id)                
    return render(request, 'employee_profile.html', {'employee': employee})


@login_required
def create_task(request):
    if request.user.role != 'manager':
        return HttpResponseForbidden()
    if request.method == 'POST':
        title = request.POST['title']
        description = request.POST['description']
        due_date = request.POST['due_date']
        department_wide = request.POST.get('department_wide', 'off')

        initial_status = 'pending'

        if department_wide == 'on':
            employees = CustomUser.objects.filter(department=request.user.department, role='employee')
            for employee in employees:
                task = Task.objects.create(
                    title=title,
                    description=description,
                    due_date=due_date,
                    assigned_to=employee,
                    status=initial_status
                )
                schedule, _ = Schedule.objects.get_or_create(user=employee, day=due_date)
                schedule.tasks.add(task)
        else:
            assigned_to_id = request.POST['assigned_to']
            assigned_to = CustomUser.objects.get(id=assigned_to_id)
            task = Task.objects.create(
                title=title,
                description=description,
                due_date=due_date,
                assigned_to=assigned_to,
                status=initial_status 
            )
            schedule, _ = Schedule.objects.get_or_create(user=assigned_to, day=due_date)
            schedule.tasks.add(task)

        return redirect('manager_dashboard')

    employees = CustomUser.objects.filter(department=request.user.department, role='employee')
    return render(request, 'create_task.html', {'employees': employees})

@login_required
def daily_schedule(request, date, employee_id=None):
    if employee_id:
        user = get_object_or_404(CustomUser, id=employee_id)
        if request.user.role != 'manager' and request.user != user:
            return HttpResponseForbidden()
    else:
        user = request.user

    day_date = datetime.strptime(date, '%Y-%m-%d').date()
    schedule, _ = Schedule.objects.get_or_create(user=user, day=day_date)
    
    if request.method == 'POST' and request.user.role == 'manager':
        form = AbsenceForm(request.POST, instance=schedule)
        if form.is_valid():
            form.save()
            return redirect('daily_schedule_employee', date=date, employee_id=employee_id)
    else:
        form = AbsenceForm(instance=schedule)

    return render(request, 'daily_schedule.html', {'schedule': schedule, 'form': form, 'employee': user})

@login_required
def weekly_schedule(request, employee_id=None):
    if employee_id:
        user = get_object_or_404(CustomUser, id=employee_id)
        if request.user.role != 'manager' and request.user != user:
            return HttpResponseForbidden()
    else:
        user = request.user

    today = datetime.today()
    start_week = today - timedelta(days=today.weekday())
    days_of_week = [start_week + timedelta(days=i) for i in range(7)]
    
    schedules = []
    for day in days_of_week:
        schedule, created = Schedule.objects.get_or_create(user=user, day=day)
        schedules.append(schedule)

    return render(request, 'weekly_schedule.html', {'schedules': schedules, 'employee': user})


@login_required
def manage_absence(request, user_id):
    if request.user.role != 'manager':
        return HttpResponseForbidden()

    employee = get_object_or_404(CustomUser, id=user_id)
    
    today = datetime.today().date()
    
    schedule, created = Schedule.objects.get_or_create(user=employee, day=today)
    
    if request.method == 'POST':
        form = AbsenceForm(request.POST, instance=schedule)
        if form.is_valid():
            form.save()
            return redirect('department_view', department_id=employee.department.id)
    else:
        form = AbsenceForm(instance=schedule)

    return render(request, 'manage_absence.html', {'form': form, 'employee': employee})

@login_required
def submit_task_for_review(request, task_id):
    task = get_object_or_404(Task, id=task_id, assigned_to=request.user)
    if task.status in ['pending', 'in_progress']:
        task.status = 'under_review'
        task.save()
        return redirect('employee_dashboard')
    return HttpResponseForbidden("You do not have permission to perform this action.")


@login_required
def review_task(request, task_id):
    task = get_object_or_404(Task, id=task_id)
    if request.user.role != 'manager' or task.assigned_to.department != request.user.department:
        return HttpResponseForbidden()

    if request.method == 'POST':
        task.status = request.POST.get('status')
        task.review_comment = request.POST.get('review_comment', '')
        task.save()
        return redirect('manager_dashboard')
    return render(request, 'review_task.html', {'task': task})

@login_required
def review_tasks(request):
    if request.user.role != 'manager':
        return HttpResponseForbidden("Access denied")

    department = request.user.department
    tasks_under_review = Task.objects.filter(assigned_to__department=department, status='under_review')

    return render(request, 'review_tasks.html', {'tasks': tasks_under_review})