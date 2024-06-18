from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, authenticate
from django.contrib.auth.decorators import login_required
from .forms import CustomUserCreationForm, CustomAuthenticationForm
from .models import CustomUser, Task, Department
from django.http import HttpResponseForbidden

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
def employee_dashboard(request):
    if request.user.role != 'employee':
        return HttpResponseForbidden()
    tasks = Task.objects.filter(assigned_to=request.user)
    return render(request, 'employee_dashboard.html', {'tasks': tasks})

@login_required
def manager_dashboard(request):
    if request.user.role != 'manager':
        return HttpResponseForbidden()
    department = request.user.department
    employees = CustomUser.objects.filter(department=department, role='employee')
    return render(request, 'manager_dashboard.html', {'employees': employees})

@login_required
def department_view(request, department_id):
    if request.user.role != 'manager':
        return HttpResponseForbidden()
    department = Department.objects.get(id=department_id)
    employees = CustomUser.objects.filter(department=department)
    return render(request, 'department_view.html', {'department': department, 'employees': employees})

def employee_profile(request, employee_id):
    employee = get_object_or_404(CustomUser, id=employee_id)                
    return render(request, 'employee_profile.html', {'employee': employee}) #Для создания страничек работников (просмотр с менеджера)


@login_required
def create_task(request):
    if request.user.role != 'manager':
        return HttpResponseForbidden()
    if request.method == 'POST':
        title = request.POST['title']
        description = request.POST['description']
        due_date = request.POST['due_date']
        assigned_to_id = request.POST['assigned_to']
        assigned_to = CustomUser.objects.get(id=assigned_to_id)
        task = Task.objects.create(title=title, description=description, due_date=due_date, assigned_to=assigned_to)
        return redirect('manager_dashboard')
    employees = CustomUser.objects.filter(department=request.user.department, role='employee')
    return render(request, 'create_task.html', {'employees': employees})
