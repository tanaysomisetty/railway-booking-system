<title>Account</title>
<%
	//then session isn't set and user didn't log in
	if (session.getAttribute("user") == null){
 %>
 You are not logged in <br/>
 <a href= "index.jsp"> Please Login</a>
 <%
	} else {
	
 %>
 Welcome <%=session.getAttribute("user")%> 	<%-- display username stored in session --%> 
 <a href = 'logout.jsp'> Log out</a>

 <%
	}
 %>
 