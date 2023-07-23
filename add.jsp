<%@ page import="java.sql.*" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="mystyle.css" />
    <style>body{
        background-color: red;
    }</style>

</head>

<body>
    <center>
        <form>
                <div class="centered">
                    <h1>Add Student</h1>
                    <label for="rollno"><b>Roll No</b></label>
                    <input type="number" name="rollno" placeholder=" Roll No" required min=1>
                    <br>

                    <label for="username"><b>Name</b></label>
                    <input type="name" name="username" placeholder=" User Name" pattern="^[A-Za-z]{2,}$" title="Please enter min 2 Alphabets, no special chars and numbers to be inserted." required onchange="this.value = this.value.trim()">
                    <br>

                    <label for="marks"><b>Marks</b></label>
                    <input type="number" name="marks" placeholder=" Marks" required min=0 max=100>
                    <br>

                    <button type="submit" class="open-button" name="btn">Save</button><br><br>
                    <a href="sms.jsp"><button type="button" class="open-button">Back</button></a>
                </div>    
        </form>
	<%
		if(request.getParameter("btn") != null)
		{
			try{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url = "jdbc:mysql://localhost:3306/sms";
				Connection con = DriverManager.getConnection(url,"root","abc123");
			
				int rollno = Integer.parseInt(request.getParameter("rollno"));
				String checkRollno = "select * from student where rollno=?";
				PreparedStatement checkRollnopst = con.prepareStatement(checkRollno);
				checkRollnopst.setInt(1, rollno);
				ResultSet rs = checkRollnopst.executeQuery();
				if(rs.next()){
	%>			
				<script>
					window.onload = function(){
						alert("Roll No already exists.");
					}
				</script>
	<%
				}else{
					String insertSql = "insert into student values(?,?,?)";
					PreparedStatement insertpst = con.prepareStatement(insertSql);

					String username = request.getParameter("username");
					double marks = Double.parseDouble(request.getParameter("marks"));

					insertpst.setInt(1, rollno);
					insertpst.setString(2, username);
					insertpst.setDouble(3, marks);
					insertpst.executeUpdate();
	%>
				<script>
 					window.onload = function() {
                       	    			alert("Record Created");
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