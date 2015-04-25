
<!doctype html>

<html>

<head>
	<asset:stylesheet href="RegisterStyleSheet.css"/>
</head>
	<body>
		<div id = "background-image"></div>
		<div id = "box">

		<form action = "${createLink(action: 'register')}" method = "POST">
			<p>First time ?</p>
			<input id = "face-icon" type = "button" onclick = "location.href = 'http://cs.oswego.edu/~alex'">
			<br>
			
				
					<p id ="notification">${notification}</p>
				
				
			<input type = "text" name = "user_name" id = "username" placeholder = "username" >
			<br>
			<input type = "password" name = "password" id = "password" placeholder = "password">
			<br>
			<input type = "submit" name = "submit" value = "Register" id = "submit">  
			<br>
			<p id = "login"><a href="${createLink(action:'login')}">Login</a></p>
		</form>
		</div>
		
	</body>

</html>