package naruto;

public class Naruto extends Ninja {
    private boolean isHokage;
    private Biju biju;

    public Naruto(String name, int age, Clan clan, Village village, boolean isHokage) {
        super(name, age, clan, village);
        this.isHokage = isHokage;
        this.learnNewJutsu(new Jutsu("Rasengan", "Um poderoso jutsu de esfera giratória."));
    }

    public boolean getIsHokage() {
        return isHokage;
    }

    public void setHokage(boolean hokage) {
        isHokage = hokage;
    }

    public Biju getBiju() {
        return biju;
    }

    public void setBiju(Biju biju) {
        this.biju = biju;
    }

    @Override
    public void showNinjaDetails() {
        System.out.println("Name: " + getName());
        System.out.println("Idade: " + getAge());
        System.out.println("Clan: " + getClan().getName() + " - " + getClan().getSymbol());
        System.out.println("Village: " + getVillage().getName());

        displayJutsus();
        
        System.out.println("É Hokage? " + getIsHokage());
    }
}
