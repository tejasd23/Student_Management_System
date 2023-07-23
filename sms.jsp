<%@ page import="java.sql.*" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Student Management System </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="mystyle.css" />
    <style>
        body{
            background-color: black;
        }
    </style>

</head>

<body>
    <center>
        <form>
            <div>
                <h1>Student Management System</h1>
                <a href="add.jsp"><button type="button" class="btn btn1"><i class="fa fa-plus"></i>  Add Student</button></a>
                <br>
                <a href="view.jsp"><button type="button" class="btn btn2"><i class="fa fa-search"></i>  View Student</button></a>
                <br>
                <a href="update.jsp"><button type="button" class="btn btn4"><i class="fa fa-edit"></i> Update Student</button></a>
                <br>
                <a href="delete.jsp"><button type="button" class="btn btn3"><i class="fa fa-trash"></i> Delete Student</button></a>
                <br><br>
                <a href="index.jsp"><button type="button" class="open-button" style="background-color: red;"><i class="fa fa-arrow-left"></i> Logout</button></a>
            </div>
        </form>
    </center>
</body>
</html>