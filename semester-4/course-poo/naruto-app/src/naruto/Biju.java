package naruto;

public class Biju {
    private String name;
    private int tails;

    public Biju(String name, int tails) {
        this.name = name;
        this.tails = tails;
    }

    public String getName() {
        return name;
    }

    public int getTails() {
        return tails;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTails(int tails) {
        this.tails = tails;
    }
}