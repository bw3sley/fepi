import os
import django
import random
from faker import Faker
from blog.models import BlogPost

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'TechTales.settings')
django.setup()

def populate_blog(n=10):
    fake = Faker()
    for _ in range(n):
        BlogPost.objects.create(
            title=fake.sentence(),
            summary=fake.paragraph(nb_sentences=3),
            content=fake.text(max_nb_chars=2000),
            featured_image=None if random.choice([True, False]) else 'featured_images/placeholder.jpg'
        )

print("Populando o banco de dados...")
populate_blog()
print("População completa!")