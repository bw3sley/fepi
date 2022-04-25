package naruto;

import java.util.List;

public class Clan {
    private String name;
    private String symbol;
    private List<Ninja> ninjas;

    public Clan(String name, String symbol) {
        this.name = name;
        this.symbol = symbol;
    }

	public String getName() {
        return name;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public void addNewNinja(Ninja ninja) {
        ninjas.add(ninja);
    }
}
