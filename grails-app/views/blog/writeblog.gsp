
<!doctype html>

<html>

	
	<head>
		<asset:stylesheet href="writeABlogPage.css"/>
		<script type="text/javascript">
			function blogTitle(){
				if(document.getElementById("blog_title").value == ""){
					document.getElementById("blog_title").value = "Title: ";
				}
			}
			function post(){
				if(document.getElementById("blog_post").value == ""){
					document.getElementById("blog_post").value = "Write here... ";
				}
			}
		</script>
	</head>
	<body>
		<p>Share your thoughts!</p>

				<p id ="username">${username}</p>
		
		<form action = "saveblog" method = "POST">
			<input id = "blog_title" type = "text" name = "blog_title" value = "Title: " onfocus = "value = ''" onblur = "blogTitle();"/>
			<br>
			<textarea id = "blog_post" type = "text" name = "blog_post" onfocus = "value = ''" onblur = "post();">Write here...</textarea>
			<br>
			<input type="hidden" name="user_name" value="@user_name">
			<!--input type="hidden" name="date" value="@Calendar.getInstance().getTime()"-->
			<input id = "submit" type = "submit" name = "Post" value = "Post">
		</form>
	</body>
</html> 