package com.bumblebee.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bumblebee.model.CUSTOMERS;
import com.bumblebee.model.Product;

public class ProductDAO {
	private String jdbcURL = "jdbc:mysql://localhost:4306/bumblebee";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	
	private static final String SELECT_ALL_Product_Customer = "select * from prodcust";
	
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	// To display all the customers in the database
	public List<Product> selectAllProduct() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Product> product = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_Product_Customer);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String Description  = rs.getString("Description");
				double price  = rs.getDouble("price");
				String Installment = rs.getString("Installment");

				product.add(new Product(id, Description, price, Installment));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}


}
