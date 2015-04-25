
<!Doctype html>

<html>
	<head>
		<asset:stylesheet href = "SettingStyleSheet.css"/>
	</head>	
	<body>
		<p>Settings</p>
		<p>Change Password</p>
		<form action= "${createLink(action:'verify_setting')}">
            <p>${notification}</p>
			Old Password: <input class = "input" type = "password" name = "old_password"/>
			<br>
			New Password: <input class = "input" type = "password" name = "new_password"/>
			<br>
			Confirm New Password: <input class = "input" type = "password" name="confirm_password"/>
			<br>
			<input class="button" type = "submit" value = "Submit"/>
			<input class="button" type = "button" value = "Back" onclick="location.href='${createLink(controller:'blog', action:'viewblog')}'"/>
		</form>
	</body>
</html>