package com.subway.model;

import java.io.Serializable;

public class AddBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4452172291064239273L;


String name;
int cost;

	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}


}
