<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Hotel List</title>
</head>
<body>
<%
Connection con = null;
Statement stmt = null;
ResultSet res = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

    String query = "SELECT * FROM hotel";
    stmt = con.createStatement();
    res = stmt.executeQuery(query);
%>

<h2 style="text-align:center;">Available Hotels</h2>
<table border="1" bgcolor="#00FF00" align="center" cellpadding="10" cellspacing="0">
<tr>
    <th>HOTEL NAME</th>
    <th>HOTEL WEBSITE</th>
    <th>HOTEL PRICE</th>
    <th>NO. OF ROOMS</th>
    <th>EXTRA FACILITIES</th>
    <th>CUSTOMER NAME</th>
    <th>EMAIL</th>
    <th>ADDRESS</th>
    <th>PASSWORD</th>
    <th>Apply Now</th>
</tr>

<%
    while (res.next()) {
%>
<tr>
    <td><%= res.getString(1) %></td>
    <td><%= res.getString(2) %></td>
    <td><%= res.getString(3) %></td>
    <td><%= res.getString(4) %></td>
    <td><%= res.getString(5) %></td>
    <td><%= res.getString(6) %></td>
    <td><%= res.getString(7) %></td>
    <td><%= res.getString(8) %></td>
    <td><%= res.getString(9) %></td>
    <td><a href="Book.html">Apply Now</a></td>
</tr>
<%
    }
} catch (Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    e.printStackTrace();
} finally {
    try {
        if (res != null) res.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
</table>

<!-- Optional clean footer -->
<div style="margin-top: 40px; text-align: center; font-size: 13px; color: #777;">
    &copy; Technical Institution Support & Service System. All rights reserved.
</div>
</body>
</html>
