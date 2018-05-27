package model;

import java.text.NumberFormat;
import java.util.Locale;

public class LineItem {
	private Product product;
	private int quantity;

	public LineItem() {

	}
	

	public LineItem(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
	}


	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal() {
		return this.product.getPrice() * this.quantity;
	}

	public String getTotalCurrencyFormat() {
		Locale here= Locale.getDefault();
		NumberFormat c = NumberFormat.getCurrencyInstance(here);
		return c.format(this.getTotal());
	}

}
