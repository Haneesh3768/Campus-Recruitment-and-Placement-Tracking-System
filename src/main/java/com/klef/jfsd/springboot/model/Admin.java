package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="admin_table")
public class Admin 
{ 
  @Id
  @Column(name ="admin_username",length = 50)
  private String username;
  @Column(name="admin_password",length = 50,nullable = false)
  private String password;
  @Column(name="admin_status", length=20)
  private String status;
  
  
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
}
