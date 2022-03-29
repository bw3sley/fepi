def RealToBitcoin(value):
  bitcoin = 182607.40 # current bitcoin value

  total = value / bitcoin

  print("Você irá ter: ", total, "bitcoins. \n")

def BitcoinToReal(value):
  bitcoin = 182607.40 # current bitcoin value

  total = value * bitcoin

  print("Você irá ter: ", total, " reais. \n")

def Menu():
    print("CONVERSÃO DE CRIPTOMOEDAS \n")

    print("\t 1 - Converter Bitcoins em Reais")
    print("\t 2 - Converter Reais em Bitcoins")
    print("\t 3 - Sair \n")

    option = int(input("Escolha uma opção: "))

    if (option == 1):
        value = float(input("Digite um valor em bitcoins: "))

        BitcoinToReal(value)

        print("--- \n")

        Menu()

    if (option == 2):
        value = float(input("Digite um valor em reais: "))

        print("--- \n")

        RealToBitcoin(value)

        Menu()

    if (option == 3):
        print("Você saiu!")
        
        print("--- \n")

        Menu()

    if (option != 1 or option != 2 or option != 3):
        print("Digite umas das opções disponíveis! \n")

        print("--- \n")

        Menu()

Menu()