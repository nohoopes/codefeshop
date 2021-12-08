package com.nhom2.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cusaccount")
public class CusAccount implements Serializable {
    private static final long serialVersionUID = 1;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    @Column(name = "CusPhone")
    private String cusphone;

    @Column(name = "CusName")
    private String cusname;

    @Column(name = "Password")
    private String password;

    public String getCusname() {
        return cusname;
    }
    public void setCusname(String cusname) {
        this.cusname = cusname;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
	public String getCusphone() {
		return cusphone;
	}
	public void setCusphone(String cusphone) {
		this.cusphone = cusphone;
	}
    
}
