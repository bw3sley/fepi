package br.com;

public class Galinha extends Animal {
    private boolean isLayingEggs;

    public Galinha(String name, int age) {
        super(name, age);

        this.isLayingEggs = false;
    }

    public boolean getIsLayingEggsStatus() {
        return isLayingEggs;
    }

    public void setIsLayingEggs() {
    	if (isLayingEggs) {
    		System.out.println("A galinha parou de botar ovos.");
    		
    		this.isLayingEggs = false;    		
    	}
    	
    	else {
			System.out.println("A galinha começou a botar ovos.");
    		
    		this.isLayingEggs = true;    		
    	}
    }
}