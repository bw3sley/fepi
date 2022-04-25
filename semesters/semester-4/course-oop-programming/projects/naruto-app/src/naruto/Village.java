package naruto;

import java.util.ArrayList;

import java.util.List;
 
public class Village {
    private String name;
    private List<Ninja> ninjas;
 
    public Village(String name) {
        this.setName(name);
        this.ninjas = new ArrayList<>();
    }
 
    public void addNewNinja(Ninja ninja) {
        ninjas.add(ninja);
    }
 
	public String getName() {
		return name;
	}
 
	public void setName(String name) {
		this.name = name;
	}
}