<%@ page language="java" import="java.net.*, java.io.*, java.sql.*" %>
<html>
<head>
    <title>Customer Registration</title>
    <script>
        function showAlert(message, redirectUrl) {
            alert(message);
            if (redirectUrl) {
                window.location.href = redirectUrl;
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
    String s10 = request.getParameter("nm10");
    String s11 = request.getParameter("nm11");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

        ps = con.prepareStatement("INSERT INTO booking VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
        ps.setString(1, s1);
        ps.setString(2, s2);
        ps.setString(3, s3);
        ps.setString(4, s4);
        ps.setString(5, s5);
        ps.setString(6, s6);
        ps.setString(7, s7);
        ps.setString(8, s8);
        ps.setString(9, s9);
        ps.setString(10, s10);
        ps.setString(11, s11);

        int rowsInserted = ps.executeUpdate();

        if (rowsInserted > 0) {
%>
            <script>
                showAlert("Booked successfully!", "Hotelview.html");
            </script>
<%
        } else {
%>
            <script>
                showAlert("Booking failed. Please try again.", "booking.html");
            </script>
<%
        }
    } catch (Exception e) {
%>
        <script>
            showAlert("An error occurred. Please try again.", "booking.html");
        </script>
<%
        e.printStackTrace();
    } finally {
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
