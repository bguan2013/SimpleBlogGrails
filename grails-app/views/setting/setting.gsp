
<!Doctype html>

<html>
	<head>
		<asset:stylesheet href = "SettingStyleSheet.css"/>
	</head>	
	<body>
		<g:img id = "header_background" dir = "images" file="setting_background.jpg"/>
		<p class="header">Settings</p>
		<hr>
		<form action= "${createLink(action:'verify_setting')}">
			<p class = "box_image"></p>
			<p class="title">Change Password</p>
            <p>${notification}</p>
			Old Password: <input class = "input" type = "password" name = "old_password"/>
			<br>
			New Password: <input class = "input" type = "password" name = "new_password"/>
			<br>
			Confirm New Password: <input class = "input" type = "password" name="confirm_password"/>
			<br>
			<input class="button" type = "submit" value = "Submit"/>
			<br>
			<input class="button" type = "button" value = "Back" onclick="location.href='${createLink(controller:'blog', action:'viewblog')}'"/>
		</form>
	</body>
</html>