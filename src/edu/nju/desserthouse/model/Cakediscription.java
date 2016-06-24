package edu.nju.desserthouse.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cakediscription")
public class Cakediscription implements Serializable{
	@Id
	private int did;
	private String category;
	private String fitPeople;
	private String fitDate;
	private String sweet;
	private String reserveCondition;
	private String raw;
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFitPeople() {
		return fitPeople;
	}
	public void setFitPeople(String fitPeople) {
		this.fitPeople = fitPeople;
	}
	public String getFitDate() {
		return fitDate;
	}
	public void setFitDate(String fitDate) {
		this.fitDate = fitDate;
	}
	public String getSweet() {
		return sweet;
	}
	public void setSweet(String sweet) {
		this.sweet = sweet;
	}
	public String getReserveCondition() {
		return reserveCondition;
	}
	public void setReserveCondition(String reserveCondition) {
		this.reserveCondition = reserveCondition;
	}
	public String getRaw() {
		return raw;
	}
	public void setRaw(String raw) {
		this.raw = raw;
	}
	public Cakediscription(){}
	public Cakediscription(int did, String category, String fitPeople, String fitDate, String sweet,
			String reserveCondition, String raw) {
		super();
		this.did = did;
		this.category = category;
		this.fitPeople = fitPeople;
		this.fitDate = fitDate;
		this.sweet = sweet;
		this.reserveCondition = reserveCondition;
		this.raw = raw;
	}
	
}
