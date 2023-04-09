package com.bumblebee.dao;

public class DbFactory {

	public DbConnector getDb (String type) {
		if(type == "mysql") {
			return new MySqlDbConnectorImpl();
		}

		else {
			return null;
		}
	}

}
