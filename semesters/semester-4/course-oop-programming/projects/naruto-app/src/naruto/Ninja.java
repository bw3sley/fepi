package naruto;

import java.util.ArrayList;

import java.util.List;

public class Ninja {
    private String name;
    private int age;
    private Clan clan;
    private Village village;
    private List<Jutsu> jutsus;

    public Ninja(String name, int age, Clan clan, Village village) {
        this.name = name;
        this.age = age;
        this.clan = clan;
        this.village = village;
        this.jutsus = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public Clan getClan() {
        return clan;
    }

    public Village getVillage() {
        return village;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setClan(Clan clan) {
        this.clan = clan;
    }

    public void setVillage(Village village) {
        this.village = village;
    }

    public void learnNewJutsu(Jutsu jutsu) {
        jutsus.add(jutsu);
    }

    public void displayJutsus() {
        System.out.println("Jutsus of " + name + ":");

        for (Jutsu jutsu : jutsus) {
            System.out.println("Name: " + jutsu.getName() + ", Description: " + jutsu.getDescription());
        }
    }

    public void showNinjaDetails() {
        System.out.println("Name: " + name);
        System.out.println("Idade: " + age);
        System.out.println("Clan: " + clan.getName() + " - " + clan.getSymbol());
        System.out.println("Village: " + village.getName());

        displayJutsus();
    }
}
