from rest_framework import serializers

from school_app import models


class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Teacher
        fields = '__all__'


class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Subject
        fields = '__all__'

class StudentSerializer(serializers.ModelSerializer):
    age = serializers.IntegerField(min_value=1, max_value=150)

    class Meta:
        model = models.Student
        fields = '__all__'