package prova.mobile;

public class Carro {
	private String marca;
	private String modelo;
	private int ano;
	private double preco;
	
	public Carro(String marca, String modelo, int ano, double preco) {
		this.setMarca(marca);
		this.setModelo(modelo);
		this.setAno(ano);
		this.setPreco(preco);
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}
	
	public void exibirInformacoes() {
		System.out.println("Marca: " + marca);
		System.out.println("Modelo: " + modelo);
		System.out.println("Ano: " + ano);
		System.out.println("Preço: " + preco);
	}
	
	public void aplicarDesconto(double percentual) {
		double precoAtual = getPreco();
		
		double novoPreco = precoAtual - (precoAtual * percentual / 100);
		
		this.setPreco(novoPreco);
		
		System.out.println("O novo preço vai ser de: " + novoPreco);
	}
	
}
