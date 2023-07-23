<%@ page import="java.sql.*" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="mystyle.css" />

</head>

<body>
    <center>
        <form method="post">
            <div class="split left">
                <div class="centered">
                    <h2>STUDENT MANAGEMENT SYSTEM</h2>
                </div>
            </div>

            <div class="split right">
                <div class="centered">

                    <h1>Sign In</h1>
                    <!-- <label for="username"><b>Username</b></label> -->
                    <input type="text" name="username" placeholder=" Username" pattern="^[A-Za-z]{2,}$" title="Please enter min 2 Alphabets, no special chars and numbers to be inserted." required onchange="this.value = this.value.trim()">
                    <br>

                    <!-- <label for="password"><b>Password</b></label> -->
                    <input type="password" name="password" placeholder=" Password" required onchange="this.value = this.value.trim()">
                    <br>

                    <button type="submit" class="open-button" name="btn">Login</button>

                    <div class="container signin">
                        <p>Don't have an account?<a href="signup.jsp">Sign Up</a></p>
                    </div>

                </div>
            </div>
        </form>
	<%
		if(request.getParameter("btn") != null)
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			try{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url = "jdbc:mysql://localhost:3306/sms";
				Connection con = DriverManager.getConnection(url,"root","abc123");
				String sql = "select * from user where username=? and password=?";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, username);
				pst.setString(2, password);
				ResultSet rs = pst.executeQuery();
				if(rs.next()){
					session.setAttribute("username", username);
					response.sendRedirect("sms.jsp");
				}else{
	%>
				<script>
 					window.onload = function() {
                            		alert("Invalid login");
					};
				</script>
	<%			
			}
				con.close();
			}catch(SQLException e){
				out.println("issue "+e);
			}
		}
	%>
    </center>
</body>
</html>













