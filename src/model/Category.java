package model;

import java.util.ArrayList;
import java.util.List;

public class Category {
	private String id;
	private String categoryName;
	private List<Product> products;

	public Category(String id, List<Product> products) {
		super();
		this.id = id;
		this.products = products;
	}

	public Category(String id) {
		super();
		this.id = id;
		this.categoryName="";
		this.products = new ArrayList<>();
	}
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Category() {
		super();
		this.id = "";
		this.products = new ArrayList<>();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
