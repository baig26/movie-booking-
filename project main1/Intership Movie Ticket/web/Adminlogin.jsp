<%-- 
    Document   : Adminlogin
    Created on : 8 Jun, 2023, 1:16:24 PM
    Author     : Aatifulla Baig
--%>

<!DOCTYPE html>
<html>
<head>
	<title>MOVIE TICKET BOOKING</title>
	<style>
		body {
			background-image: url("./images/film.jpg");
			background-size: cover;
			background-position: center;
			font-family: Arial, sans-serif;
			color: #fff;
		}
		
		.navbar {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 20px;
			background-color: transparent;
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			z-index: 999;
		}
		
		.navbar h1 {
			font-size: 36px;
			font-weight: bold;
			margin: 0;
			color: #fff;
		}
		
		.btn {
			padding: 10px 20px;
			border-radius: 5px;
			border: none;
			background-color: #333;
			color: #fff;
			font-size: 16px;
			cursor: pointer;
		}
		
		.btn:hover {
			background-color: #555;
		}
		
		.container {
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			height: 100vh;
			padding-top: 80px;
		}
                    .card {
  background-color: rgba(255, 255, 255, 0.8);
  border-radius: 10px;
  padding: 40px;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.5);
  max-width: 500px;
  width: 100%;
  color: #000;
  margin: 0 auto;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}


		
		.card-title {
			font-size: 36px;
			font-weight: bold;
			margin-bottom: 20px;
		}
		
		.form-group {
			margin-bottom: 20px;
		}
		
		.form-group label {
			display: block;
			margin-bottom: 5px;
		}
		
		.form-control {
			padding: 10px;
			border-radius: 5px;
			border: none;
			background-color: #eee;
			width: 100%;
			font-size: 16px;
			color: #333;
		}
		
		.btn-submit {
			background-color: #333;
			color: #fff;
		}
	</style>
</head>
<body>
	<header>
		<nav class="navbar">
			<h1>MOVIE TICKET BOOKING</h1>
			<a href="login.jsp" class="btn">User Login</a>
		</nav>
	</header>
	
<div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <h2 class="card-title1">Admin</h2>
                        <form method="post" action="AdminLogin" id="form">
                            <div class="form-group1">
                                <label for="exampleInputEmail1">Username</label>
                                <input type="text" class="form-control" autocomplete="off" name="admin_user" id="admin_user" aria-describedby="emailHelp" placeholder="Enter username" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" name="admin_pw" id="admin_pw" placeholder="Password" required="">
                            </div>
                            <button type="submit" class="btn login-btn" ">Login</button>
                        </form>
                    </div>
        </div>
      </div>
    </div>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <script>
        alert("<%= message %>");
    </script>
<%
        session.removeAttribute("message");
    }
%>
</body>
</html>
