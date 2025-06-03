<%@ page language="java" import="java.net.*, java.io.*, java.sql.*" %>
<html>
<head>
    <title>Customer Registration</title>
    <script>
        function showAlert(message, redirect) {
            alert(message);
            if (redirect) {
                window.location.href = "custlogin.html";
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

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load Oracle JDBC Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish connection
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

            // Prepare SQL statement
            ps = con.prepareStatement("INSERT INTO customer VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, s1);
            ps.setString(2, s2);
            ps.setString(3, s3);
            ps.setString(4, s4);
            ps.setString(5, s5);
            ps.setString(6, s6);
            ps.setString(7, s7);

            // Execute update
            int rowsInserted = ps.executeUpdate();
            
            if (rowsInserted > 0) {
    %>
                <script>
                    showAlert("Login successful!", true);
                </script>
    <%
            } else {
    %>
                <script>
                    showAlert("Invalid username or password. Please try again.", true);
                </script>
    <%
            }
        } catch (Exception e) {
    %>
            <script>
                showAlert("Invalid username or password. Please try again.", true);
            </script>
    <%
            e.printStackTrace();
        } finally {
            // Close resources
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
