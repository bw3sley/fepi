package naruto;

import java.util.List;

public class HatakeClan extends Clan {
    private List<String> hatakeMembers;
 
    public HatakeClan(String name, String symbol, List<String> hatakeMembers) {
        super(name, symbol);
        this.hatakeMembers = hatakeMembers;
    }
 
    public List<String> getHatakeMembers() {
        return hatakeMembers;
    }
 
    public void setHatakeMembers(List<String> hatakeMembers) {
        this.hatakeMembers = hatakeMembers;
    }
}