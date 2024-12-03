from django.core.management.base import BaseCommand
from blog.models import BlogPost
from faker import Faker
import random

class Command(BaseCommand):
    help = 'Popula o banco de dados com produtos fictícios'

    def handle(self, *args, **kwargs):
        fake = Faker()
        for _ in range(20):
            BlogPost.objects.create(
                title=fake.sentence(),
                summary=fake.paragraph(nb_sentences=3),
                content=fake.text(max_nb_chars=2000),
                featured_image=None if random.choice([True, False]) else 'blog/static/imgs/placeholder.jpg'
            )
        self.stdout.write(self.style.SUCCESS('Produtos fictícios criados com sucesso!'))