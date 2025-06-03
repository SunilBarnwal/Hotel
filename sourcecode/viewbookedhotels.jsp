
<%@page language="java"%>
<%@page import="java.sql.*"%> 
 <body>
<%
Connection con=null;
Statement stmt=null;
ResultSet res=null;
String xx;
try
{
 

   Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
 
 
stmt=con.createStatement();

xx="select * from booking ";
 
res=stmt.executeQuery(xx); %>

<table border=1 bgcolor="#00FF00">
<tr>
<th>CUSTOMER NAME</th>
<th>AGE</th>
<th>GENDER</th>
<th>PHONE</th>
<th>EMAIL</th>
<th>ADDRESS</th>
<th>HOTEL NAME</th>
<th>ROOM TYPE</th>
<th>NUMBER OF ROOMS</th>
<th>NUMBER OF PEOPLE</th>
<th>GROUP GENDER</th>
 
</tr>
<% while(res.next())
{ %>

<tr>
<td><%=res.getString(1)%></td>
<td><%=res.getString(2)%></td>
<td><%=res.getString(3)%></td>
<td><%=res.getString(4)%></td>
<td><%=res.getString(5)%></td>
<td><%=res.getString(6)%></td>
<td><%=res.getString(7)%></td>
<td><%=res.getString(8)%></td>
<td><%=res.getString(9)%></td>
<td><%=res.getString(10)%></td>
<td><%=res.getString(11)%></td>
 
 

</tr>
<%
}
}
catch(ClassNotFoundException e)
{

}
%>

 </table></center>

</form>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P></td></tr></table></td>
<td width=205 valign=top class=contentright ><table width=185 border=0 align=center cellpadding=0 cellspacing=0 >
<tr>
<td><p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>. </p></td></tr></table>
  <p>&nbsp;</p></td></tr></table></td></tr></table>
<table width=1001 border=0 align=center cellpadding=0 cellspacing=0 >
<tr>
<td class=footerbackground ><table border=0 align=center cellpadding=0 cellspacing=0 >
<tr>
<td>
</td></tr></table>
<table border=0 align=center cellpadding=0 cellspacing=0 >
<tr>
<td class=copyright style4 ><font color="#FFFFFF">Copyright &copy;Technical  Institution Support &amp;amp; Service System. All rights reserved.<br>  
  <a href="http://www.ewisoft.com/" target="_blank" class=style5 ></a></td>
</tr>
</table></td></tr></table></body></html>