from django.shortcuts import render, get_object_or_404
from .models import BlogPost

def index(request):
    posts = BlogPost.objects.all()
    return render(request, 'index.html', {'posts': posts})

def post_detail(request, post_id):
    post = get_object_or_404(BlogPost, pk=post_id)
    return render(request, 'post_detail.html', {'post': post})