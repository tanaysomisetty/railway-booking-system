<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse & Search</title>
</head>
<body>

Search for Train Schedule:
<br>
	<form method="get" action="BSresultPage.jsp">
	<table>
		<tr>
			<td>Origin: </td> 
			<td> 
				<select name="origin" size=1>
					<option value="Trenton">Trenton</option>
					<option value="Princeton">Princeton</option>
					<option value="New Brunswick">New Brunswick</option>
					<option value="Newark">Newark</option>
					<option value="Penn Station New York">Penn Station New York</option>
				</select>&nbsp;<br> 
			</td>
			
			<td>Destination: </td> 
			<td> 
				<select name="destination" size=1>
					<option value="Trenton">Trenton</option>
					<option value="Princeton">Princeton</option>
					<option value="New Brunswick">New Brunswick</option>
					<option value="Newark">Newark</option>
					<option value="NYpennStation">New York Penn Station</option>
				</select>&nbsp;<br> 
			</td>
		<tr>
		
		<tr>
			<td>Date of Travel: </td> 
			<td> 
				<select name="dateOfTravel" size=1>
					<option value="12/17">12/17</option>
					<option value="12/18">12/18</option>
					<option value="12/19">12/19</option>
					<option value="12/20">12/20</option>
					<option value="12/21">12/21</option>
				</select>&nbsp;<br> 
			</td>
		</tr>
		
		<tr>
			<td>Sort By: </td> 
			<td> 
				<select name="sortBy" size=1>
					<option value="arrivalTime">arrival time</option>
					<option value="departureTime">departure time</option>
					<option value="fare">fare</option>
				</select>&nbsp;<br> 
			</td>
		</tr>
	</table>
		<input type="submit" value="submit">
		
	</form>
<br>

</body>
</html>