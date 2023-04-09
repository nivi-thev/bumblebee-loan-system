package com.bumblebee.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bumblebee.model.CUSTOMERS;

public class CustomerDAO {
	private String jdbcURL = "jdbc:mysql://localhost:4306/bumblebee";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";

	private static final String INSERT_USERS_SQL = "INSERT INTO CUSTOMERS" + "  (email, password, dob, fullName, usedAmount, loanBalance, mobilePhone, iPlan) VALUES "
			+ " (?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String SELECT_USER_BY_ID = "select id, email,password,dob,fullName,usedAmount,loanBalance,mobilePhone,iPlan from CUSTOMERS where id=?";
	private static final String SELECT_ALL_USERS = "select * from CUSTOMERS";
	private static final String DELETE_USERS_SQL = "delete from CUSTOMERS where id = ?;";
	private static final String UPDATE_USERS_SQL = "update CUSTOMERS set email=?, password=?, dob=?, fullName=?, usedAmount=?, loanBalance=?, mobilePhone=?, iPlan=? where id = ?;";

	public CustomerDAO() {

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

	// To INSERT Customer Data into Database
	public void insertCustomers(CUSTOMERS customers) throws SQLException {
		System.out.println(INSERT_USERS_SQL);

		try (Connection connection = getConnection();
				PreparedStatement pst = connection.prepareStatement(INSERT_USERS_SQL)) {
			pst.setString(1, customers.getEmail());
			pst.setString(2, customers.getPassword());
			pst.setString(3, customers.getDob());
			pst.setString(4, customers.getFullName());
			pst.setDouble(5, customers.getUsedAmount());
			pst.setDouble(6, customers.getLoanBalance());
			pst.setString(7, customers.getMobilePhone());
			pst.setInt(8, customers.getiPlan());
			System.out.println(pst);
			pst.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	// To Select Customer Data by the ID
	public CUSTOMERS selectCustomers(int id) {
		CUSTOMERS customers = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String email       = rs.getString("email");
				String password    = rs.getString("password");
				String dob         = rs.getString("dob");
				String fullName    = rs.getString("fullName");
				double usedAmount  = rs.getDouble("usedAmount");
				double loanBalance = rs.getDouble("loanBalance");
				String mobilePhone = rs.getString("mobilePhone");
				int iPlan       = rs.getInt("iPlan");

				customers = new CUSTOMERS(id, email, password, dob, fullName, usedAmount, loanBalance, mobilePhone, iPlan);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customers;
	}

	// To display all the customers in the database
	public List<CUSTOMERS> selectAllCustomers() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<CUSTOMERS> customers = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String email       = rs.getString("email");
				String password    = rs.getString("password");
				String dob         = rs.getString("dob");
				String fullName    = rs.getString("fullName");
				double usedAmount  = rs.getDouble("usedAmount");
				double loanBalance = rs.getDouble("loanBalance");
				String mobilePhone = rs.getString("mobilePhone");
				int iPlan       = rs.getInt("iPlan");

				customers.add(new CUSTOMERS(id, email, password, dob, fullName, usedAmount, loanBalance, mobilePhone, iPlan));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customers;
	}


	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateUser(CUSTOMERS customers) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
			PreparedStatement pst = connection.prepareStatement(UPDATE_USERS_SQL);) {
			System.out.println("updated USer:"+pst);

			pst.setString(1, customers.getEmail());
			pst.setString(2, customers.getPassword());
			pst.setString(3, customers.getDob());
			pst.setString(4, customers.getFullName());
			pst.setDouble(5, customers.getUsedAmount());
			pst.setDouble(6, customers.getLoanBalance());
			pst.setString(7, customers.getMobilePhone());
			pst.setInt(8, customers.getiPlan());
			pst.setInt(9, customers.getId());

			rowUpdated = pst.executeUpdate() > 0;
		}
		return rowUpdated;
	}



}


