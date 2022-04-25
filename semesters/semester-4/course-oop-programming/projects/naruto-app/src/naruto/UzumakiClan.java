package naruto;

import java.util.List;

public class UzumakiClan extends Clan {
    private List<String> uzumakiMembers;

    public UzumakiClan(String name, String symbol, List<String> uzumakiMembers) {
        super(name, symbol);
        this.uzumakiMembers = uzumakiMembers;
    }

    public List<String> getUzumakiMembers() {
        return uzumakiMembers;
    }

    public void setUzumakiMembers(List<String> uzumakiMembers) {
        this.uzumakiMembers = uzumakiMembers;
    }
}