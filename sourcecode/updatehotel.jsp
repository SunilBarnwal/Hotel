<%@ page language="java" import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html>
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
Statement s = null;
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");


PreparedStatement ps = con.prepareStatement("update hotel set HOTELWEBSITE='"+s2+"',HOTELPRICE='"+s3+"',NOOFROOM='"+s4+"',EXTRAFACILITIES='"+s5+"',CUSTOMERNAME='"+s6+"',EMAIL='"+s7+"',ADDRESS='"+s8+"',PASSWORD='"+s9+"' where HOTELNAME='"+s1+"'");
 
 
ps.executeUpdate();
}
catch(Exception se){out.println(se);}
%>
<p> your record have been updated succefully</p>
</body>
</html>