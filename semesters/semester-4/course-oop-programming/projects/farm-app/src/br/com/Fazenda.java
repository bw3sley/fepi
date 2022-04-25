package br.com;

import java.util.ArrayList;

public class Fazenda {
    private ArrayList<Area> areas;
    private ArrayList<Animal> animals;

    public Fazenda() {
        this.areas = new ArrayList<>();
        this.animals= new ArrayList<>();
    }

    public void addNewArea(Area area) {
        areas.add(area);
    }

    public void addNewAnimal(Animal animal) {
    	animals.add(animal);        	
    }

    public void getAreas() {
    	try {
    		System.out.println("Areas cadastradas: ");
    		
    		for (Area area : areas) {
				if (area instanceof Lavoura) {
    				Lavoura lavoura = (Lavoura) area;
					
					System.out.println("Tipo: " + area.getType() + ", Tamanho: " + area.getSize());
				}

				else {
					Pasto pasto = (Pasto) area;
					
					System.out.println("Tipo: " + area.getType() + ", Tamanho: " + area.getSize());
				}
    		}    		
    	}
    	
    	catch (NullPointerException error) {
    		System.out.println("A lista de areas está vazia, adicione um valor antes.");
    	}
    }

    public void getAnimals() {
    	try {    		
    		System.out.println(""); // Apenas para dar um espaço
    		System.out.println("Animais cadastrados:");
    		
    		for (Animal animal : animals) {
    			if (animal instanceof Vaca) {
    				Vaca vaca = (Vaca) animal;
    				
    				vaca.setIsMilkingStatus();
    				
    				System.out.println("Nome: " + animal.getName() + ", Idade: " + animal.getAge() + ", A vaca está ordenhando? " + vaca.getIsMilkingStatus());
    			}
    			
    			else {
    				Galinha galinha = (Galinha) animal;
    				
    				galinha.setIsLayingEggs();
    				
    				System.out.println("Nome: " + animal.getName() + ", Idade: " + animal.getAge() + ", A vaca está botando ovo? " + galinha.getIsLayingEggsStatus());    				
    			}
    		}
    	}
    	
    	catch (NullPointerException error) {
    		System.out.println("A lista de animais está vazia, adicione um valor antes.");
    	}
    }
}