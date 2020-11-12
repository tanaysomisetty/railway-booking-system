<% 
session.invalidate(); //destroys session
response.sendRedirect("index.jsp");


%>