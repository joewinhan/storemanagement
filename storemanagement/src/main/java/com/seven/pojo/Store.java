package com.seven.pojo;

public class Store {
	private String id;
	private String commodityId;
	private double stockBalance;
	private int status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}
	public double getStockBalance() {
		return stockBalance;
	}
	public void setStockBalance(double stockBalance) {
		this.stockBalance = stockBalance;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
