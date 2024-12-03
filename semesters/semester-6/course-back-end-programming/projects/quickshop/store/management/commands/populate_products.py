from django.core.management.base import BaseCommand
from store.models import Product
from faker import Faker
import random

class Command(BaseCommand):
    help = 'Popula o banco de dados com produtos fictícios'

    def handle(self, *args, **kwargs):
        fake = Faker()
        for _ in range(20):
            Product.objects.create(
                name=fake.word().capitalize(),
                description=fake.text(),
                price=round(random.uniform(10, 100), 2),
                discount=round(random.uniform(5, 50), 2) if random.choice([True, False]) else None,
                image='store/static/imgs/default.jpg',
            )
        self.stdout.write(self.style.SUCCESS('Produtos fictícios criados com sucesso!'))