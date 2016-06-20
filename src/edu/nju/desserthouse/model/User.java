package edu.nju.desserthouse.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User implements Serializable{
	@Id
	private int id; 
	private String pwd;
	private String custel;
	
	public User(){}
	public User(int id,String pwd){
		this.id = id;
		this.pwd = pwd;
	}
	
	public User(int id, String pwd, String custel) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.custel = custel;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getCustel() {
		return custel;
	}
	public void setCustel(String custel) {
		this.custel = custel;
	}
	
	
}
