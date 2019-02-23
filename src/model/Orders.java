package model;

public class Orders {
private String order_id;

private String shoes_id;

private String uid;

private String time;

private float unit_price;

public float getUnit_price() {
	return unit_price;
}

public void setUnit_price(float unit_price) {
	this.unit_price = unit_price;
}

private float total_price;

private int item_amount;

private String coupon_id;

private int status;

private String seller_id;

private String size;

private String color;

private int address_num;


public int getAddress_num() {
	return address_num;
}

public void setAddress_num(int address_num) {
	this.address_num = address_num;
}

public String getOrder_id() {
	return order_id;
}

public void setOrder_id(String order_id) {
	this.order_id = order_id;
}

public String getShoes_id() {
	return shoes_id;
}

public void setShoes_id(String shoes_id) {
	this.shoes_id = shoes_id;
}

public String getUid() {
	return uid;
}

public void setUid(String uid) {
	this.uid = uid;
}

public String getTime() {
	return time;
}

public void setTime(String time) {
	this.time = time;
}

public float getTotal_price() {
	return total_price;
}

public void setTotal_price(float total_price) {
	this.total_price = total_price;
}

public int getItem_amount() {
	return item_amount;
}

public void setItem_amount(int item_amount) {
	this.item_amount = item_amount;
}

public String getCoupon_id() {
	return coupon_id;
}

public void setCoupon_id(String coupon_id) {
	this.coupon_id = coupon_id;
}

public int getStatus() {
	return status;
}

public void setStatus(int status) {
	this.status = status;
}

public String getSeller_id() {
	return seller_id;
}

public void setSeller_id(String seller_id) {
	this.seller_id = seller_id;
}

public String getSize() {
	return size;
}

public void setSize(String size) {
	this.size = size;
}

public String getColor() {
	return color;
}

public void setColor(String color) {
	this.color = color;
}

}
