package prova.mobile;

public class Main {
	public static void main(String[] args) {
		Carro carro1 = new Carro("teste 1", "outro teste 1", 2001, 100);
		Carro carro2 = new Carro("teste 2", "outro teste 2", 2002, 200);
		Carro carro3 = new Carro("teste 3", "outro teste 3", 2003, 300);
		
		carro1.exibirInformacoes();
		carro2.exibirInformacoes();
		carro3.exibirInformacoes();
		
		carro1.aplicarDesconto(10);
		carro2.aplicarDesconto(10);
		carro3.aplicarDesconto(10);
	}
}
