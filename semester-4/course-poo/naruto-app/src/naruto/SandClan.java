package naruto;

import java.util.List;

public class SandClan extends Clan {
    private List<String> sandClanMembers;

    public SandClan(String name, String symbol, List<String> sandClanMembers) {
        super(name, symbol);
        this.sandClanMembers = sandClanMembers;
    }

    public List<String> getSandClanMembers() {
        return sandClanMembers;
    }

    public void setSandClanMembers(List<String> sandClanMembers) {
        this.sandClanMembers = sandClanMembers;
    }
}