<%@ page import="java.sql.*" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="mystyle.css" />
    <style>
        body {
            background-color: red;
        }
    </style>

</head>

<body>
    <center>
        <form onsubmit="return confirmUpdate();">
            <div class="centered">
                <h1>Update Student</h1>
                <label for="rollno"><b>Roll No</b></label>
                <input type="number" name="rollno" placeholder=" Roll No" required min=1>
                <br>

                <label for="username"><b>Name</b></label>
                <input type="name" name="username" placeholder=" User Name" pattern="^[A-Za-z]{2,}$" title="Please enter min 2 Alphabets, no special chars and numbers to be inserted." required onchange="this.value = this.value.trim()">
                <br>

                <label for="marks"><b>Marks</b></label>
                <input type="number" name="marks" placeholder=" Marks" required min=0 max=100>
                <br>

                <button type="submit" class="open-button" name="btn">Update</button><br><br>
                <a href="sms.jsp"><button type="button" class="open-button">Back</button></a>
            </div>
        </form>
	<%
		if(request.getParameter("btn") != null)
		{
			try{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url = "jdbc:mysql://localhost:3306/sms";
				Connection con = DriverManager.getConnection(url, "root", "abc123");
	
				int rollno = Integer.parseInt(request.getParameter("rollno"));
	                    	String checkRollnoSql = "SELECT * FROM student WHERE rollno=?";
        	            	PreparedStatement checkRollnoPst = con.prepareStatement(checkRollnoSql);
                	    	checkRollnoPst.setInt(1, rollno);
                    		ResultSet rs = checkRollnoPst.executeQuery();
				if (!rs.next()) {
	%>
				<script>
 					window.onload = function() {
                            		alert("Roll No does not exists. Please try again.");
					};
				</script>
	<%
				}else{
					String updatesql = "update student set username=?, marks=? where rollno=?";
					PreparedStatement updatepst = con.prepareStatement(updatesql);

					String username = request.getParameter("username");
					double marks = Double.parseDouble(request.getParameter("marks"));

					updatepst.setString(1, username);
					updatepst.setDouble(2, marks);
					updatepst.setInt(3,rollno);
					int r = updatepst.executeUpdate();
	%>
				<script>
 					window.onload = function() {
                            		alert("Record Updated");
					};
				</script>
	<%
				}
				con.close();
			}catch(SQLException e){
				out.println("issues "+e);
			}
		}
	%>
	<script>
        	function confirmUpdate() {
                	return confirm("Are you sure you want to Update this record?");
            	}
       	</script>
    </center>
</body>
</html>


