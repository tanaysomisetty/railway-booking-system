<%@ page import="java.sql.*"%>
<%
	String userid = request.getParameter("username");
String pwd = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://project2.c7y8oeljbznd.us-east-2.rds.amazonaws.com:3306/CustomerLogin",
		"cs336","cs336group25");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from  accounts where username ='" + userid + "' and password='" + pwd + "'");
//check if result query is null
if (rs.next()) {
	session.setAttribute("user", userid); //stores username in session
	out.println("welcome" + userid);
	out.println("<a href='logout.jsp'>Log out</a>");
	response.sendRedirect("success.jsp");
} else {
	out.println("Invalid password <a href='index.jsp'>try again</a>");
}
%>