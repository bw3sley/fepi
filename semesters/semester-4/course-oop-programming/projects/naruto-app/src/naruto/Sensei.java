package naruto;

import java.util.List;

public class Sensei {
    private String name;
    private int age;
    private Clan clan;
    private Village village;
    private List<Ninja> students;

    public Sensei(String name, int age, Clan clan, Village village, List<Ninja> students) {
        this.name = name;
        this.age = age;
        this.clan = clan;
        this.village = village;
        this.students = students;
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

    public void addNewStudent(Ninja ninja) {
        students.add(ninja);
    }

    public void displayStudents() {
        System.out.println("Students of " + name + ":");

        for (Ninja student : students) {
            System.out.println("Name: " + student.getName() + ", Clan: " + student.getClan().getName());
        }
    }

    public void showSenseiDetails() {
        System.out.println("Name: " + name);
        System.out.println("Idade: " + age);
        System.out.println("Clan: " + clan.getName() + " - " + clan.getSymbol());
        System.out.println("Village: " + village.getName());

        displayStudents();
    }
}