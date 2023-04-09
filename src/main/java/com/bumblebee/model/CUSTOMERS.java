package com.bumblebee.model;

public class CUSTOMERS {

	private int id;
	private String email;
	private String password;
	private String dob;
	private String fullName;
	private double usedAmount;
	private double loanBalance;
	private String mobilePhone;
	private int iPlan;

	public CUSTOMERS() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CUSTOMERS(String fullName, String email, String password, String dob, double usedAmount,
			double loanBalance, String mobilePhone, int iPlan) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.usedAmount = usedAmount;
		this.loanBalance = loanBalance;
		this.mobilePhone = mobilePhone;
		this.iPlan = iPlan;
	}

	public CUSTOMERS(int id, String fullName, String email, String password, String dob, double usedAmount,
			double loanBalance, String mobilePhone, int iPlan) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.usedAmount = usedAmount;
		this.loanBalance = loanBalance;
		this.mobilePhone = mobilePhone;
		this.iPlan = iPlan;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public double getUsedAmount() {
		return usedAmount;
	}

	public void setUsedAmount(double usedAmount) {
		this.usedAmount = usedAmount;
	}

	public double getLoanBalance() {
		return loanBalance;
	}

	public void setLoanBalance(double loanBalance) {
		this.loanBalance = loanBalance;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public int getiPlan() {
		return iPlan;
	}

	public void setiPlan(int iPlan) {
		this.iPlan = iPlan;
	}




}
