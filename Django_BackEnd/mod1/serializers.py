from mod1.models import test2,dataget
from rest_framework.serializers import ModelSerializer


class test2Serializer(ModelSerializer):
    class Meta:
        model = test2
        fields = '__all__'
        depth=1
        

class datagetSerializer(ModelSerializer):
    class Meta:
        model = dataget
        fields = '__all__'
        depth=1