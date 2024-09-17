# core/views.py
from django.http import HttpResponse
from django.shortcuts import render

# View "Sobre o site"
def sobre_site(request):
    return HttpResponse("Esta é a página sobre o site. Aqui explicamos a proposta da plataforma.")

# View "Perfil do usuário"
def perfil_usuario(request, username):
    return HttpResponse(f"Perfil do usuário: {username}")

# View "Página de contato"
def contato(request):
    return HttpResponse("Página de contato: Envie suas dúvidas para contato@example.com.")

# View explicando as rotas
def home(request):
    html = """
    <h1>Bem-vindo ao Site</h1>
    <p>Rotas disponíveis:</p>
    <ul>
        <li><a href='/sobre/'>Sobre o site</a></li>
        <li><a href='/perfil/john-doe/'>Perfil do usuário (exemplo: john-doe)</a></li>
        <li><a href='/contato/'>Contato</a></li>
    </ul>
    """
    return HttpResponse(html)