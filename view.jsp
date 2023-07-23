<%@ page import="java.sql.*" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="mystyle.css" />
    <style>
        body {
            background-color: white;
        }
    </style>

</head>

<body>
    <center>
	    	<h1 style="color: black;">View Student</h1>
                <table border="1" style="width:50%; ">
                    <tr>
                        <th> Roll No </th>
                        <th> Name </th>
                        <th> Marks </th>
                    </tr>
		    <%
			try{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url = "jdbc:mysql://localhost:3306/sms";
				Connection con = DriverManager.getConnection(url, "root", "abc123");
				String sql = "select * from student";
				PreparedStatement pst = con.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();

				while(rs.next()){
		    %>
				<tr style="text-align:center;">
					<td> <%= rs.getInt(1) %> </td>
					<td> <%= rs.getString(2) %> </td>
					<td> <%= rs.getDouble(3) %> </td>
				</tr>
		    <%
				}
				con.close();
			}catch(SQLException e){
				out.println("issue "+e);
			}
		    %>
                </table>
                <br><br>
                <a href="sms.jsp"><button type="button" class="open-button">Back</button></a>
    </center>
</body>
</html>