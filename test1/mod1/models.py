from django.db import models

# Create your models here.


class UserDetails(models.Model):
    email = models.EmailField(max_length=255, unique=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    mobile_number = models.CharField(max_length=255, null=True, blank=True)
    # current_image = models.ImageField(upload_to=None, null=True, blank=True)

    def __str__(self):
        return f"{self.email}"
        
class test2(models.Model):
    label=models.CharField(max_length=255, null=False,unique=True)
    bennett_email =models.CharField(max_length=255, null=False)
    
    def save(self, *args, **kwargs):
        super(test2, self).save(*args, **kwargs)

class dataget(models.Model):
    title = models.CharField(max_length=255, null=False,unique=False)
    timenven = models.CharField(max_length=255, null=False,unique=False)
    prereq = models.CharField(max_length=255, null=False,unique=False)
    out = models.CharField(max_length=255, null=False,unique=False)
    shodet = models.CharField(max_length=255, null=False,unique=False)
    date = models.DateField(null=True,blank=True)

    def save(self, *args, **kwargs):
        super(dataget, self).save(*args, **kwargs)

