package com.bumblebee.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlDbConnectorImpl implements DbConnector {

	@Override
	public Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:4306/bumblebee";
		String user = "root";
		String password = "";
 		Connection connection = DriverManager.getConnection(url, user, password);

 		return connection;
	}






}
