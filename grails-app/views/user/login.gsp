
<!doctype html>


<html>
    <head>
    	<asset:stylesheet href="LoginStyleSheet.css"/>
    </head>

	<body>
		<div id = "background-image"></div>
		<div id = "box">

		<form action = "@routes.Application.login()" method = "POST">
			<p>Simple Blog</p>

			<input id = "face-icon" type = "button" onclick = "location.href = 'http://cs.oswego.edu/~alex'">
			<br>
		
				<p id = "notification">${notification}</p>

			
			<input type = "email" name = "user_name" id = "username" placeholder = "username" >
			<br>
			<input type = "password" name = "password" id = "password" placeholder = "password">
			<br>
			<input type = "submit" name = "submit" value = "Login" id = "submit">  
			<br>
			<p id = "first-time"><a href="${createLink(action:'register')}">Register</a></p>
		</form>

		</div>
		
	</body>

</html>