<%@ page import="java.sql.*"%>
<%
	String userid = request.getParameter("username");
String pwd = request.getParameter("password");
String accountType = request.getParameter("account");
if (accountType == null || userid == "" || pwd == "") {
	out.println("Please make sure to fill out all Fields <a href='index.jsp'>try again</a>");
	return;
}
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
		"jdbc:mysql://project2.c7y8oeljbznd.us-east-2.rds.amazonaws.com:3306/Group25Train", "cs336", "cs336group25");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from " + accountType + " where username ='" + userid + "' and password='" + pwd + "'");
//check if result query is null
if (rs.next()) {
	session.setAttribute("user", userid); //stores username in session
	out.println("welcome" + userid);
	out.println("<a href='logout.jsp'>Log out</a>");
	String redirectPage = String.format("%s/%s.jsp", accountType, accountType);
	//Redirects to one of 3 pages, Customer,Login,Admin
	response.sendRedirect(redirectPage);
} else {
	out.println("Invalid password <a href='index.jsp'>try again</a>");
}
%>