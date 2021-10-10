package com.shop.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@AllArgsConstructor @NoArgsConstructor
@Setter @Getter @ToString
@Table(name = "category")
@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String title;
	@Column(length = 3000)
	private String description;
	
	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<>();

	public Category(String title, String description, List<Product> products) {
		super();
		this.title = title;
		this.description = description;
		this.products = products;
	}
	

	
}
