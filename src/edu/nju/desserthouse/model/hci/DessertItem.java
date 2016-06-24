package edu.nju.desserthouse.model.hci;

public class DessertItem {
	private int did;
	private String name;
	private String image;
	private int pcid;
	private double price;
	private String discription;
	
	/*for cake*/
	private int mount = 0;
	private String j = "";
	private boolean isCake = false;
	
	public DessertItem(){}
	
	public DessertItem(int did, String name, String image, int pcid, double price, String discription) {
		this.did = did;
		this.name = name;
		this.image = image;
		this.pcid = pcid;
		this.price = price;
		this.discription = discription;
	}

	public DessertItem(int did, String name, String image, int pcid, double price) {
		this.did = did;
		this.name = name;
		this.image = image;
		this.pcid = pcid;
		this.price = price;
	}

	public DessertItem(int did, String name, String image, int pcid) {
		this.did = did;
		this.name = name;
		this.image = image;
		this.pcid = pcid;
	}

	public DessertItem(int did, String name, String image) {
		this.did = did;
		this.name = name;
		this.image = image;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	public int getPcid() {
		return pcid;
	}

	public void setPcid(int pcid) {
		this.pcid = pcid;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}
	
	public int getMount() {
		return mount;
	}
	
	public void setMount(int mount) {
		this.mount = mount;
	}

	public String getJ() {
		return j;
	}

	public void setJ(String j) {
		switch(j)
		{
		case "1":this.j = "时令水果";break;
		case "2":this.j = "奶油布丁";break;
		case "3":this.j = "密豆";break;
		case "4":this.j = "果冻";break;
		default:this.j = "时令水果";break;
		}
	}

	public boolean isCake() {
		return isCake;
	}

	public void setCake(boolean isCake) {
		this.isCake = isCake;
	}
}
