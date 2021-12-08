package com.nhom2.model;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Bills")
public class Bill implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	private String Code;
	public String getCode() {
		return Code;
	}
	public void setCode(String code) {
		Code = code;
	}
	private String Cusname;
	private String Phone;
	private String Address;
	private String Email;
	private int total;
	private Date date;
	private int discount;
	private String status;
	private String method;
	public Bill(int id, String cusname, String phone, String address, String email, int total, Date date, int discount,
			String status, String method) {
		super();
		this.id = id;
		Cusname = cusname;
		Phone = phone;
		Address = address;
		Email = email;
		this.total = total;
		this.date = date;
		this.discount = discount;
		this.status = status;
		this.method = method;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCusname() {
		return Cusname;
	}
	public void setCusname(String cusname) {
		Cusname = cusname;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getdiscount() {
		return discount;
	}
	public void setdiscount(int discount) {
		this.discount = discount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public Bill() {
		super();
		this.id = 0;
		Cusname = "";
		Phone = "";
		Address = "";
		Email = "";
		this.total = 0;
		
		this.discount = 0;
		this.status = "";
		this.method = "";
	}

}
