# Generated by Django 4.1.3 on 2022-11-24 10:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mod1', '0002_test2'),
    ]

    operations = [
        migrations.CreateModel(
            name='dataget',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255)),
                ('timenven', models.CharField(max_length=255)),
                ('prereq', models.CharField(max_length=255)),
                ('out', models.CharField(max_length=255)),
                ('shodet', models.CharField(max_length=255)),
            ],
        ),
    ]
