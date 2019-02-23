package model;

public class Stock {
private String seller_id;

private String shoes_id;

private  String size;

private int amount;

private String left_time;

private String color;
public String getColor() {
	return color;
}

public void setColor(String color) {
	this.color = color;
}

public String getSeller_id() {
	return seller_id;
}

public void setSeller_id(String seller_id) {
	this.seller_id = seller_id;
}

public String getShoes_id() {
	return shoes_id;
}

public void setShoes_id(String shoes_id) {
	this.shoes_id = shoes_id;
}

public String getSize() {
	return size;
}

public void setSize(String size) {
	this.size = size;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}

public String getLeft_time() {
	return left_time;
}

public void setLeft_time(String left_time) {
	this.left_time = left_time;
}


}
