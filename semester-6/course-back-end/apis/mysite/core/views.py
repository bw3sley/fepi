# core/views.py
from django.http import HttpResponse
from django.shortcuts import render

GITHUB_USER = "bw3sley";

# View "Sobre o site"
def sobre_site(request):
    html = f"""
    <html>
    <head>
        <style>
            body {{
                background-color: #0d1117;
                color: #f0f6fc;
                font-family: monospace;
                padding: 1.25rem;
            }}

            h1 {{
                margin-bottom: 1.25rem;
            }}

            p {{
                line-height: 140%;
            }}

            a {{
                color: #f0f6fc;
            }}

            a:hover {{
                color: #f97316;
            }}
        </style>
    </head>
    <body>
        <h1>Sobre este site</h1>
        <p>Este site foi criado para apresentar meu <a href="https://github.com/{GITHUB_USER}" target="_blank">perfil no GitHub</a>, onde compartilho meus projetos e aprendizados. 
        Através deste portal, você pode acessar minha página no GitHub, explorar meu trabalho e descobrir mais sobre meus interesses e habilidades em desenvolvimento.</p>
    </body>
    </html>
    """
    return HttpResponse(html)

# View "Perfil do usuário"
def perfil_usuario(request, username):
    html = f"""
    <html>
    <head>
        <style>
            body {{
                background-color: #0d1117;
                color: #f0f6fc;
                font-family: monospace;
                padding: 1.25rem;
            }}
            
            h1 {{
                margin-bottom: 1.25rem;
            }}

            .company {{
                color: #4493F8;
            }}

            .socials {{
                display: flex;
                align-items: center;
                gap: 1rem;
            }}

            blockquote {{
                margin: 0;

                padding: 0 0 0 1rem;

                color: #9198A1;

                border-left: .25rem solid #9198A1;
            }}
        </style>
    </head>
    <body>
        <h1>Wesley Júnior ({username})</h1>

        <p>Full Stack Developer at <a href="#" class="company">@2clix</a> 🧡</p>
        
        <div class="socials">
            <a href="https://www.linkedin.com/in/{GITHUB_USER}/" target="_blank">
                <img src="https://img.shields.io/badge/-Wesley%20Junior-f97316?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/{GITHUB_USER}/" />
            </a>
            
            <a href="mailto:{GITHUB_USER}@gmail.com" target="_blank">
                <img src="https://img.shields.io/badge/-{GITHUB_USER}@gmail.com-f97316?style=flat-square&logo=Gmail&logoColor=white&link=mailto:{GITHUB_USER}@gmail.com" />
            </a>
        </div>

        <p>Enthusiast of the finest web and mobile development technologies.</p>

        <p>Passionate about creating new things and changing people's lives through programming.</p>

        <p>Currently focused on NodeJS, ReactJS, and React Native.</p>

        <blockquote>
            <p>"If you're seeking a great opportunity, uncover a big problem."</p>
        </blockquote>

        <p>I'll turn your problems into excellent solutions 🚀</p>
    </body>
    </html>
    """
    return HttpResponse(html)

# View "Página de contato"
def contato(request):
    html = f"""
    <html>
    <head>
        <style>
            body {{
                background-color: #0d1117;
                color: #f0f6fc;
                font-family: monospace;
                padding: 1.25rem;
            }}

            h1 {{
                margin-bottom: 1.25rem;
            }}
            
            p {{
                line-height: 160%;
            }}
            
            .link {{
                color: #f0f6fc;
            }}

            .link:hover {{
                color: #f97316;
            }}

            .btn {{
                background-color: #f97316;
                color: #f3f3f3;

                display: inline-block;

                font-weight: bold;
                font-size: .75rem;

                margin-top: .5rem;

                border-radius: 6px;

                padding: .625rem 1rem;

                text-decoration: none;
            }}

            .btn:hover {{
                background-color: #ea580c;
            }}
        </style>
    </head>
    <body>
        <h1>Contato</h1>
        
        <p>Para entrar em contato comigo, visite <a href="https://github.com/{GITHUB_USER}" class="link" target="_blank">meu perfil no GitHub</a>. 
        Lá você poderá ver meus projetos e enviar mensagens através das issues dos repositórios.</p>
    </body>
    </html>
    """
    return HttpResponse(html)

# View explicando as rotas
def home(request):
    html = f"""
    <html>
    <head>
        <style>
            body {{
                background-color: #0d1117;
                color: #f0f6fc;
                font-family: monospace;
                padding: 1.25rem;
            }}
            
            h1 {{
                margin-bottom: 1.25rem;
            }}
            
            li {{
                margin: 10px 0;
            }}

            a {{
                color: #f0f6fc;
                text-decoration: none;
            }}
        </style>
    </head>
    <body>
        <h1>Bem-vindo ao meu site</h1>

        <p>Explore as seguintes páginas:</p>
        
        <ul>
            <li><a href='/sobre/'>Sobre o site</a></li>
            <li><a href='/perfil/{GITHUB_USER}'>Perfil de exemplo ({GITHUB_USER})</a></li>
            <li><a href='/contato/'>Contato</a></li>
        </ul>
    </body>
    </html>
    """
    return HttpResponse(html)