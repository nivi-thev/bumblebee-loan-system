package com.bumblebee.model;

public class Product {
	
	private int id;
	private String Description;
	private double price;
	private String Installment;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Product(int id, String Description, double price, String Installment) {
		this.id = id;
		this.Description = Description;
		this.price = price;
		this.Installment = Installment;	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getInstallment() {
		return Installment;
	}

	public void setInstallment(String installment) {
		Installment = installment;
	}
	
	
	
	
}
