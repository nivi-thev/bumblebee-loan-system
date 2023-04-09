<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:4306/bumblebee";

String userid = "root";
String password = "";
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
  String productId = request.getParameter("id");
  connection = DriverManager.getConnection(connectionUrl, userid, password);
  statement=connection.createStatement();
  String sql ="INSERT INTO `ordered_product` (`id`, `Description`, `price`, `Installment`) SELECT `id`, `Description`, `price`, `Installment` FROM `prodcust` WHERE `id` = '"+productId+"'";
  int rowsAffected = statement.executeUpdate(sql);
  if(rowsAffected > 0){
    out.println("<h2>Order placed successfully!</h2>");
  } else {
    out.println("<h2>Failed to place order!</h2>");
  }
  connection.close();
} catch (Exception e) {
  e.printStackTrace();
}
%>

</body>
</html>