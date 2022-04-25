package naruto;

import java.util.List;

public class UchihaClan extends Clan {
    private List<String> uchihaMembers;

    public UchihaClan(String name, String symbol, List<String> uchihaMembers) {
        super(name, symbol);
        this.uchihaMembers = uchihaMembers;
    }

    public List<String> getUchihaMembers() {
        return uchihaMembers;
    }

    public void setUchihaMembers(List<String> uchihaMembers) {
        this.uchihaMembers = uchihaMembers;
    }
}