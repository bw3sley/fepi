package naruto;

import java.util.List;

public class Kakashi extends Sensei {
    private String specialTechnique;

    public Kakashi(String name, int age, Clan clan, Village village, List<Ninja> students, String specialTechnique) {
        super(name, age, clan, village, students);
        this.specialTechnique = specialTechnique;
    }

	public String getSpecialTechnique() {
        return specialTechnique;
    }

    public void setSpecialTechnique(String specialTechnique) {
        this.specialTechnique = specialTechnique;
    }

    @Override
    public void showSenseiDetails() {
        System.out.println("Name: " + getName());
        System.out.println("Idade: " + getAge());
        System.out.println("Clan: " + getClan().getName() + " - " + getClan().getSymbol());
        System.out.println("Village: " + getVillage().getName());

        displayStudents();
        
        System.out.println("Técnica especial: " + getSpecialTechnique());
    }
}
