package naruto;

public class Gaara extends Ninja {
    private boolean hasShukaku;

    public Gaara(String name, int age, Clan clan, Village village, boolean hasShukaku) {
        super(name, age, clan, village);
        this.hasShukaku = hasShukaku;
    }

    public boolean hasShukaku() {
        return hasShukaku;
    }

    public void setShukaku(boolean shukaku) {
        hasShukaku = shukaku;
    }
}