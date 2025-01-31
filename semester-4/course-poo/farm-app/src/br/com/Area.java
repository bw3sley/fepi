package br.com;

public class Area {
    private double size;
    private String type; // Talvez não ter esse type aqui
 
    public Area(double size, String type) {
        this.size = size;
        this.type = type;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double calcularRendimento(String type, double value) {
        if (type == "lavoura") {
			return value * 2;
		 }

		return value * 1.2;
    }
}