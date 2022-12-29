from django.shortcuts import render
from django.http import HttpResponse
from mod1.serializers import test2Serializer,datagetSerializer
from rest_framework.response import Response
from mod1.models import test2,dataget
from rest_framework import status
from rest_framework.views import APIView
# Create your views here.
def home(request):
    return HttpResponse("hi")
from django.shortcuts import render
from django.http import HttpResponse
import requests# Create your views here.
def users(request):    #pull data from third party rest api
    response = requests.get('https://jsonplaceholder.typicode.com/users')    #convert reponse data into json
    users = response.json()
    print(users);
    return HttpResponse("Users")
    pass

class gett(APIView):
    def get(self, request):
        try:
            user = request.user
            recommended = test2.objects.all()
            serializer = test2Serializer(recommended, many=True)
            return Response(serializer.data,status=status.HTTP_200_OK)
        except Exception as e:
            return Response(e, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



class postt(APIView):
    def post(self, request):
        try:
            data = request.data
            cre=test2.objects.create(label=data['label'],bennett_email=data['email'])
            return Response(status=status.HTTP_200_OK)
        except Exception as e:
            return Response(e, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class datpost(APIView):
    def post(self, request):
        # try:
            data = request.data
            print(data)
            cre=dataget.objects.create(title=data['title'],timenven=data['timenven'],prereq=data['prereq'],out=data['out'],shodet=data['shodet'],date=data['datee'])
            return Response(status=status.HTTP_200_OK)
        # except Exception as e:
            # return Response(e, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class datgett(APIView):
    def get(self, request):
        try:
            user = request.user
            recommended = dataget.objects.all()
            serializer = datagetSerializer(recommended, many=True)
            return Response(serializer.data,status=status.HTTP_200_OK)
        except Exception as e:
            return Response(e, status=status.HTTP_500_INTERNAL_SERVER_ERROR)