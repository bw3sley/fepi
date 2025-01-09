def LEITURASENSOR(sensor):
    parametro_retornado = input(f'Insira a {sensor}:')
    return parametro_retornado

def EXAUSTOR(estado):
    print(f'EXAUSTOR: {estado}')

def AQUECIMENTO(temperatura):
    print(f'AQUECIMENTO: {temperatura}')

def TIMER(estado):
    print('Contando...')

def DESUMIDIFICACAO():
    print('Iniciando procedimento de desumidificação...')

    umidade = int(LEITURASENSOR('UMIDADE'))
    temperatura_interna = int(LEITURASENSOR('TEMPERATURA INTERNA'))
    
    if temperatura_interna >= 15 and umidade >= 40:
        EXAUSTOR('ON')
    
    if temperatura_interna < 15 and umidade >= 40:
        EXAUSTOR('ON')
        AQUECIMENTO(100)
    
    if temperatura_interna >= 100:
        AQUECIMENTO('OFF')
    
    if umidade <= 5:
        EXAUSTOR('OFF')
        AQUECIMENTO('OFF')
        
        print('Desumidificação concluída!')
        
        return
    
    else:
        DESUMIDIFICACAO()

def COCCAO():
    print('Iniciando procedimento de cocção')
    
    umidade = int(LEITURASENSOR('UMIDADE'))
    temperatura_interna = int(LEITURASENSOR('TEMPERATURA INTERNA'))
    
    if umidade > 15:
        EXAUSTOR('ON')
    
    if umidade <= 5:
        EXAUSTOR('OFF')
    
    if temperatura_interna <= 200:
        AQUECIMENTO(380)
    
    if umidade <= 5 and temperatura_interna >= 380:
        print('Inserir conteúdo para cocção')
        print(' - quando inserir, pressione o botão pronto')
        
        pronto = LEITURASENSOR('BOTÃO')
        
        if pronto == 'ON':
            AQUECIMENTO(380)
            TIMER('SET')
    
    else:
        COCCAO()


umidade = int(LEITURASENSOR('UMIDADE'))
temperatura_interna = int(LEITURASENSOR('TEMPERATURA INTERNA'))
temperatura_externa = int(LEITURASENSOR('TEMPERATURA EXTERNA'))

if temperatura_externa <= 20 and umidade >= 40:
    clima = 'Inverno'

    DESUMIDIFICACAO()
    COCCAO()

else:
    clima = 'Verão'
    
    COCCAO()