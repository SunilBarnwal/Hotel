<%@ page language="java" import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html>
<body>
<% 
String s1 = request.getParameter("nm1");
 
Connection con = null;
Statement s = null;
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");


PreparedStatement ps = con.prepareStatement("delete from hotel where hotelname='"+s1+"'");
 
 
ps.executeUpdate();
}
catch(Exception se){out.println(se);}
%>
<p> your record have been deleted succefully</p>
</body>
</html>