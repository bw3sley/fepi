package br.com;

public class Lavoura extends Area {
    private int amountOfVegetables;

    public Lavoura(double size, String type, int amountOfVegetables) {
        super(size, type);

        this.amountOfVegetables = amountOfVegetables;
    }

    public int getAmountOfVegetables() {
        return amountOfVegetables;
    }

	public void setAmountOfVegetables(int amountOfVegetables) {
		this.amountOfVegetables = amountOfVegetables;
	}
}