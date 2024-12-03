from django.db import models

class BlogPost(models.Model):
    title = models.CharField(max_length=200)
    summary = models.TextField(max_length=400)
    content = models.TextField()
    published_date = models.DateTimeField(auto_now_add=True)
    featured_image = models.ImageField(upload_to='blog/static/imgs/', null=True, blank=True)

    def __str__(self):
        return self.title