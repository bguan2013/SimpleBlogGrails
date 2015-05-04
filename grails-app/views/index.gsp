
<! doctype html>


<html>

	<head>
		<asset:stylesheet href="SimpleBlog.css"/>
	
	</head>
	<body>

		<div>
		<p id = "welcome_title">Welcome to Simple Blog</p>
		</div>
		<div>
    		<form>
    			<div>
    			<input type="button" onclick = "location.href = '${createLink(controller:'user', action:'login')}'" name="Login" value="Login" id="login" />
    			<input type="button" onclick = "location.href = '${createLink(controller:'user', action:'register')}'" name="First Time" value="First Time" id="first-time"/>
    			<input type="button" onclick = "location.href = '${createLink(controller:'blog', action:'viewblog')}'" name="View Blog" value="View Blog" id="view-blog"/>
    			</div>
    		</form>
		</div>

		<video autoplay loop id = "bgvid" poster="${resource(dir: 'images', file: 'dandelion.jpg')}">
			<link type ="video/mp4" src = "${resource(dir: 'videos', file: 'Looping_Clouds.mp4')}">
		</video>

		<footer id= "footer">
			<p>
				&copy;2015 Bo Guan, All Rights Reserved
			</p>
		</footer>
	</body>

</html>
