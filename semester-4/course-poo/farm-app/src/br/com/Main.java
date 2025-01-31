package br.com;

public class Main {
    public static void main(String[] args) {
        Fazenda fazenda = new Fazenda();

        Lavoura lavoura1 = new Lavoura(10.0, "Lavoura", 10);
        Pasto pasto1 = new Pasto(15.0, "Pasto", 10);

        fazenda.addNewArea(lavoura1);
        fazenda.addNewArea(pasto1);

        Vaca vaca1 = new Vaca("Vaca1", 5);
        Galinha galinha1 = new Galinha("Galinha1", 2);

        fazenda.addNewAnimal(vaca1);
        fazenda.addNewAnimal(galinha1);
        
        fazenda.getAreas();
        fazenda.getAnimals();
    }
}