package com.subway.model;

public class CartBean {
int orderid;

String cname;
String itemname;
int cost;
public int getOrderid() {
	return orderid;
}
public void setOrderid(int orderid) {
	this.orderid = orderid;
}

public String getCname() {
	return cname;
}
public void setCname(String cname) {
	this.cname = cname;
}
public String getItemname() {
	return itemname;
}
public void setItemname(String itemname) {
	this.itemname = itemname;
}
public int getCost() {
	return cost;
}
public void setCost(int cost) {
	this.cost = cost;
}

}
