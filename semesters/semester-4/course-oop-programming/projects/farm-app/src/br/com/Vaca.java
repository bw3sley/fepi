package br.com;

public class Vaca extends Animal {
    private boolean isMilking;

    public Vaca(String name, int age) {
        super(name, age);

        this.isMilking = false;
    }

    public boolean getIsMilkingStatus() {
        return isMilking;
    }

    public void setIsMilkingStatus() {
    	if (isMilking) {
    		System.out.println("A vaca está sendo ordenhada.");
    		
    		this.isMilking = true;    		
    	}
    	
    	else {
    		System.out.println("A vaca está sendo ordenhada.");
    		
    		this.isMilking = true;
    	}
    }
}