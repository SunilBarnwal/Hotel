<%@page language="java"%>
<%@page import="java.sql.*"%>
<html>
<head>
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
Connection con = null;
PreparedStatement pstmt = null;
ResultSet res = null;

try {
    // Retrieve user input
    String email = request.getParameter("nm1");
    String password = request.getParameter("nm2");

    // Load Oracle JDBC Driver
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

    // Use PreparedStatement to prevent SQL injection
    String query = "SELECT * FROM customer WHERE email = ? AND password = ?";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1, email);
    pstmt.setString(2, password);
    res = pstmt.executeQuery();

    if (res.next()) {
%>
        <script>
            showAlert("Login successful!", "Hotelview.html");
        </script>
<%
    } else {
%>
        <script>
            showAlert("Invalid username or password. Please try again.", "custlogin.html");
        </script>
<%
    }
} catch (Exception e) {
    e.printStackTrace(); // Log the error instead of displaying it on the page
} 
%>
</body>
</html>
