package model;

import java.io.Serializable;
import java.text.NumberFormat;

import dao.CategoryDAO;
import dao.ProductDao;
import service.MD5;

public class Product implements Serializable {
	private String productCode;
	private String productName;
	private String productDescription;
	private String productImage;
	private double price;
	private String categoryId;

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public Product() {
		productCode = "";
		productName = "";
		productImage = "";
		productDescription = "";
		categoryId = "";
		price = 0.00;

	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDecription) {
		this.productDescription = productDecription;
	}

	public Product(String productCode, String productName, String productDecription, String productImage, double price,
			String categoryId) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productDescription = productDecription;
		this.productImage = productImage;
		this.price = price;
		this.categoryId = categoryId;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductName() {
		return productName;
	}

	public String getImageUrl() {
		return productImage;
	}

	public void setImageUrl(String imageUrl) {
		this.productImage = imageUrl;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPriceCurrencyFormat() {
		NumberFormat currency = NumberFormat.getCurrencyInstance();
		return currency.format(this.price);
	}
	public static void main(String[] args) {
		System.out.println(MD5.encryption("admin"));
	}

}
