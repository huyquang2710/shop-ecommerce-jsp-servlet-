package com.shop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@AllArgsConstructor @NoArgsConstructor
@Setter @Getter @ToString
@Table(name = "product")
@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	@Column(length = 3000)
	private String description;
	private String photo;
	private Integer price;
	private Integer discount;
	private Integer quantity;
	
	@ManyToOne
	private Category category;

	public Product(String name, String description, String photo, Integer price, Integer discount, Integer quantity,
			Category category) {
		this.name = name;
		this.description = description;
		this.photo = photo;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.category = category;
	}
	
}
