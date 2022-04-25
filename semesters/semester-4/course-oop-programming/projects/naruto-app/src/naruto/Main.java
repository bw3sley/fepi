package naruto;

import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Village hiddenLeaf = new Village("Hidden Leaf");
 
        UzumakiClan uzumakiClan = new UzumakiClan("Uzumaki", "Red Spiral", Arrays.asList("Naruto", "Kushina", "Boruto"));
        UchihaClan uchihaClan = new UchihaClan("Uchiha", "Sharingan", Arrays.asList("Sasuke", "Itachi", "Madara"));
        HatakeClan hatakeClan = new HatakeClan("Hatake", "White Chidori", Arrays.asList("Kakashi", "Sakumo"));
 
        Naruto naruto = new Naruto("Naruto", 20, uzumakiClan, hiddenLeaf, true);
        Sasuke sasuke = new Sasuke("Sasuke", 22, uchihaClan, hiddenLeaf, true);
 
        Kakashi kakashi = new Kakashi("Kakashi", 30, hatakeClan, hiddenLeaf, Arrays.asList(naruto, sasuke), "Sharingan");
 
        naruto.learnNewJutsu(new Jutsu("Rasengan", "Um poderoso jutsu de esfera giratória."));
        sasuke.learnNewJutsu(new Jutsu("Chidori", "Um jutsu que utiliza eletricidade."));

        System.out.println("Informações de Naruto:");
        naruto.showNinjaDetails();
 
        System.out.println("\nInformações de Sasuke:");
        sasuke.showNinjaDetails();
 
        System.out.println("\nInformações do Sensei Kakashi:");
        kakashi.showSenseiDetails();
    }
}
 
