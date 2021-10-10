package com.shop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@AllArgsConstructor @NoArgsConstructor
@Setter @Getter @ToString
@Table(name = "user")
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10)
	private Integer id;
	@Column(length = 100)
	private String username;
	@Column(length = 100)
	private String email;
	@Column(length = 100)
	private String password;
	@Column(length = 12)
	private String phone;
	@Column(length = 1500)
	private String picture;
	@Column(length = 1500)
	private String address;
	
	public User(String username, String email, String password, String phone, String picture, String address) {
		this.username = username;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.picture = picture;
		this.address = address;
	}
	
	
}
