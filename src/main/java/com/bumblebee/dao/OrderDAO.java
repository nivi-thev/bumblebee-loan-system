package com.bumblebee.dao;

//import java.net.http.HttpRequest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bumblebee.model.Product;

public class OrderDAO {
	private String jdbcURL = "jdbc:mysql://localhost:4306/bumblebee";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	
	//private static final String Insert_OrderedProduct =  "INSERT INTO `Ordered product` (`id`, `Description`, `price`, `Installment`) SELECT `id`, `Description`, `price`, `Installment` FROM `prodcust` WHERE `id` = '"+productId+"'";;
	
	
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
		/*public List<Product> selectAllOrderProduct() {

			// using try-with-resources to avoid closing resources (boiler plate code)
			List<Product> product = new ArrayList<>();
			
			// Step 1: Establishing a Connection
			
			 * try (Connection connection = getConnection();
			 * 
			 * public String productId = HttpRequest.getParameter("id"); Statement statement
			 * = connection.createStatement(); String sql =
			 * "INSERT INTO `Ordered product` (`id`, `Description`, `price`, `Installment`) SELECT `id`, `Description`, `price`, `Installment` FROM `prodcust` WHERE `id` = '"
			 * +productId+"'"; int rowsAffected = statement.executeUpdate(sql)); if
			 * (rowsAffected > 0) { out.println("<h2>Order placed successfully!</h2>"); }
			 * else { out.println("<h2>Failed to place order!</h2>"); } connection.close();
			 * } catch (Exception e) { e.printStackTrace();
			 
				// Step 2:Create a statement using connection object
				
				 * PreparedStatement preparedStatement =
				 * connection.prepareStatement(SELECT_ALL_Product_Customer);) {
				 * System.out.println(preparedStatement); // Step 3: Execute the query or update
				 * query ResultSet rs = preparedStatement.executeQuery();
				 * 
				 * // Step 4: Process the ResultSet object. while (rs.next()) { int id =
				 * rs.getInt("id"); String Description = rs.getString("Description"); double
				 * price = rs.getDouble("price"); String Installment =
				 * rs.getString("Installment");
				 * 
				 * product.add(new Product(id, Description, price, Installment));
				 * 
				 * } } catch (SQLException e) { e.printStackTrace(); }
				 
			return product;*/
	
		/*
		 * public boolean placeOrder(String productId) { boolean success = false;
		 * 
		 * try { //Connection connection = DriverManager.getConnection(jdbcURL,
		 * jdbcUsername, jdbcPassword); Connection connection = getConnection();
		 * Statement statement = connection.createStatement(); String sql =
		 * "INSERT INTO `ordered_product` (`id`, `Description`, `price`, `Installment`) SELECT `id`, `Description`, `price`, `Installment` FROM `prodcust` WHERE `id` = '"
		 * +productId+"'"; int rowsAffected = statement.executeUpdate(sql); if
		 * (rowsAffected > 0) { success = true; } connection.close(); } catch
		 * (SQLException e) { e.printStackTrace(); }
		 * 
		 * return success; } }
		 */
	
	private Connection connection;
    private Statement statement;
    private PreparedStatement preparedStatement;

    public OrderDAO() {
        // Initialize database connection
        try {
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int addOrder(String productId) {
        int rowsAffected = 0;
        try {
            String sql = "INSERT INTO `ordered_product` (`id`, `Description`, `price`, `Installment`) "
                       + "SELECT `id`, `Description`, `price`, `Installment` FROM `prodcust` WHERE `id` = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productId);
            rowsAffected = preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowsAffected;
    }

    public void closeConnection() {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
