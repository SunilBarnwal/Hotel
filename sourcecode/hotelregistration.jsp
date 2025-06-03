<%@ page language="java" import="java.net.*, java.io.*, java.sql.*" %>
<html>
<head>
    <title>Hotel Registration</title>
    <script>
        function showAlert(message, redirect) {
            alert(message);
            if (redirect) {
                window.location.href = redirect;
            }
        }
    </script>
</head>
<body>
<% 
String s1 = request.getParameter("nm1");
String s2 = request.getParameter("nm2");
String s3 = request.getParameter("nm3");
String s4 = request.getParameter("nm4");
String s5 = request.getParameter("nm5");
String s6 = request.getParameter("nm6");
String s7 = request.getParameter("nm7");
String s8 = request.getParameter("nm8");
String s9 = request.getParameter("nm9");

Connection con = null;
PreparedStatement ps = null;

try {
    // Load Oracle JDBC Driver
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

    // Prepare SQL Statement
    String query = "INSERT INTO hotel VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    ps = con.prepareStatement(query);
    ps.setString(1, s1);
    ps.setString(2, s2);
    ps.setString(3, s3);
    ps.setString(4, s4);
    ps.setString(5, s5);
    ps.setString(6, s6);
    ps.setString(7, s7);
    ps.setString(8, s8);
    ps.setString(9, s9);

    // Execute the Query
    int rowsInserted = ps.executeUpdate();

    if (rowsInserted > 0) {
%>
        <script>
            showAlert("Registration successful!", "hotellogin.html");
        </script>
<%
    } else {
%>
        <script>
            showAlert("Registration failed. Please try again.", "hotelregist.html");
        </script>
<%
    }
} catch (Exception e) {
    e.printStackTrace(); // Log the error in server console
%>
    <script>
        showAlert("An error occurred. Please try again.", "hotelregist.html");
    </script>
<%
} finally {
    // Close Resources
    try {
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}
%>
</body>
</html>
