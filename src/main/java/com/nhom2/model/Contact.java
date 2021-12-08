package com.nhom2.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="contact")
public class Contact {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	private String conname;
	private String conphone;
	private String conmail;
	private String message;
	
	public Contact(int id, String conname, String conphone, String conmail, String message) {
		super();
		this.id = id;
		this.conname = conname;
		this.conphone = conphone;
		this.conmail = conmail;
		this.message = message;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getConName() {
		return conname;
	}
	public void setConName(String conname) {
		this.conname = conname;
	}
	public String getConPhone() {
		return conphone;
	}
	public void setConPhone(String conphone) {
		this.conphone = conphone;
	}
	public String getConMail() {
		return conmail;
	}
	public void setConMail(String conmail) {
		this.conmail = conmail;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Contact()
	{
		super();
		id=0;
		conname="";
		conphone="";
		conmail="";
		message="";
	}
}