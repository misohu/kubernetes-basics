from django.urls import path
from django.urls.conf import include
from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter()
router.register('teachers', views.TeacherViewset)
router.register('subjects', views.SubjectViewset)
router.register('students', views.StudentViewset)

urlpatterns = [
    # path('hello-world', views.hello_world, name="hello-world"),
    # path('subjects', views.list_subjects, name="list-subjects"),
    # path('subjects/<int:pk>', views.subject_detail, name="subject_detail"),
    path('', include(router.urls)),
]
