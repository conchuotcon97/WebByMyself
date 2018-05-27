package model;

import java.io.Serializable;
import java.util.ArrayList;

import com.sun.messaging.jmq.admin.bkrutil.iASBrokerAdmin;
import com.sun.messaging.jmq.util.GoodbyeReason;

public class Cart implements Serializable {
	private ArrayList<LineItem> items;

	public Cart() {
		this.items = new ArrayList<>();
	}

	public Cart(ArrayList<LineItem> items) {
		this.items = items;
	}

	public ArrayList<LineItem> getItems() {
		return items;

	}

	public int getCount() {
		return items.size();
	}

	// thêm sản phẩm vào cart dựa vào productCode
	public void addItem(LineItem item) {
		
		this.items.add(item);

	}

	public LineItem lookup(String productCode) {
		for (LineItem lineItem : items) {
			if (productCode.equals(lineItem.getProduct().getProductCode())) {
				return lineItem;
			}
		}
		return null;
	}

	public void removeItem(LineItem item) {
		String code = item.getProduct().getProductCode();
		int quantity = item.getQuantity();
		for (int i = 0; i < this.items.size(); i++) {
			LineItem lineItem = this.items.get(i);
			if (lineItem.getProduct().getProductCode().equals(code)) {
				items.remove(item);
				return;
			}

		}
	}

	public int countItem() {
		return items.size();
	}

	public double total() {
		int price = 0;
		for (int i = 0; i < items.size(); i++) {
			price += items.get(i).getTotal();

		}
		return price;
	}

}
