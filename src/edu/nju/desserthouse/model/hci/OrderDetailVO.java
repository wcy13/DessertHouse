package edu.nju.desserthouse.model.hci;

public class OrderDetailVO {
	private int odid;
	private int oid;
	private int did;
	private double price;
	private int amount;
	private String dname;
	private String image;
	public int getOdid() {
		return odid;
	}
	public void setOdid(int odid) {
		this.odid = odid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public OrderDetailVO(){}
	public OrderDetailVO(int odid, int oid, int did, double price, int amount, String dname, String image) {
		super();
		this.odid = odid;
		this.oid = oid;
		this.did = did;
		this.price = price;
		this.amount = amount;
		this.dname = dname;
		this.image = image;
	}
	
}
