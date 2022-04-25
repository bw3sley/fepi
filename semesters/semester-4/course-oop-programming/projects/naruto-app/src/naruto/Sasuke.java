package naruto;

public class Sasuke extends Ninja {
    private boolean hasSharingan;

    public Sasuke(String name, int age, Clan clan, Village village, boolean hasSharingan) {
        super(name, age, clan, village);
        this.hasSharingan = hasSharingan;
    }

    public boolean hasSharingan() {
        return hasSharingan;
    }

    public void setSharingan(boolean sharingan) {
        hasSharingan = sharingan;
    }

    @Override
    public void showNinjaDetails() {
        System.out.println("Name: " + getName());
        System.out.println("Idade: " + getAge());
        System.out.println("Clan: " + getClan().getName() + " - " + getClan().getSymbol());
        System.out.println("Village: " + getVillage().getName());

        displayJutsus();
        
        System.out.println("Tem Sharingan? " + hasSharingan());
    }
}