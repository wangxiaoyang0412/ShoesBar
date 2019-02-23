package model;

public class Coupon {
private String coupon_id;

private String name;

private int type;

private String seller_id;

private float discount_price;

private int amount;

private String pic;
public String getPic() {
	return pic;
}

public void setPic(String pic) {
	this.pic = pic;
}

public String getCoupon_id() {
	return coupon_id;
}

public void setCoupon_id(String coupon_id) {
	this.coupon_id = coupon_id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public int getType() {
	return type;
}

public void setType(int type) {
	this.type = type;
}

public String getSeller_id() {
	return seller_id;
}

public void setSeller_id(String seller_id) {
	this.seller_id = seller_id;
}

public float getDiscount_price() {
	return discount_price;
}

public void setDiscount_price(float discount_price) {
	this.discount_price = discount_price;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}



}
