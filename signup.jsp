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
                    <h1>Sign Up</h1>
                    <!-- <label for="username"><b>Username</b></label> -->
                    <input type="text" name="username" placeholder=" Username" pattern="^[A-Za-z]{2,}$" title="Please enter min 2 Alphabets, no special chars and numbers to be inserted." required onchange="this.value = this.value.trim()">
                    <br>

                    <!-- <label for="password"><b>Password</b></label> -->
                    <input type="password" name="password" placeholder=" Password" required onchange="this.value = this.value.trim()">
                    <br>

                    <!-- <label for="repeat"><b>Repeat Password</b></label> -->
                    <input type="password" name="repeat" placeholder="Repeat Password" required onchange="this.value = this.value.trim()">
                    <br>

                    <button type="submit" class="open-button" name="btn">Sign up</button>

                    <div class="container signin">
                        <p>Already have an account?<a href="index.jsp">Sign in</a></p>
                    </div>
                </div>
            </div>
        </form>
	<%
		if(request.getParameter("btn") != null)
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String repeat = request.getParameter("repeat");
			if(!password.equals(repeat)){
	%>
				<script>
 					window.onload = function() {
                            		alert("Password doesn't match");
					};
				</script>
	<%
				return;
			}
			try{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url = "jdbc:mysql://localhost:3306/sms";
				Connection con = DriverManager.getConnection(url,"root","abc123");
				String sql = "insert into user values(?,?)";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, username);
				pst.setString(2, password);
				pst.executeUpdate();
				response.sendRedirect("index.jsp");
				con.close();
			}catch(SQLException e){
				out.println("issue "+e);
			}
		}
	%>
    </center>
</body>
</html>