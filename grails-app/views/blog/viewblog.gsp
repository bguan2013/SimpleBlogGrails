

<!DOCTYPE html>

<html>
	<head>
		<asset:stylesheet href="BlogPageStyleSheet.css"/>
		<title>Blog Page</title>
		<script type="text/javascript">
			var xmlHttp1 = new XMLHttpRequest();
			function saveComment(comment){
				xmlHttp1.open("Post", "CommentBlog", true);
				xmlHttp1.onreadystatechange = displayComment;
				xmlHttp1.send(comment);
			}
			function displayComment(){
				if(xmlHttp1.readyState == 4 && xmlHttp1.status == 200){
					
				}
			}
			function getNewBlogs(index){

				var xmlHttp2 = new XMLHttpRequest();
				xmlHttp2.onreadystatechange = function(){

					//Inorder to use JSON with AJAX, we need to use the third party library JQuery
					var json = xmlHttp2.responseXML;


				}
				xmlHttp2.open("Post","NewBlog",true);
				xmlHttp2.send(index);
			}

		</script>
	</head>
	<body>
		
		<g:img id = "header_background" dir="images" file = "waterDrop.jpg"/>
		<div class = "header">
			<a href="${createLink(action: 'writeblog')}" id = "write_button"></a>
			<a href="${createLink(controller: 'rss', action: 'rssnews')}" id = "rss_button"></a>
			

			<div>${username}</div>
		
			
			<nav>
				<ul>
    				<li>
    					<a id = "icon" href=""></a>
        				<ul>
        					<li>
        						<a href="${createLink(controller:'setting', action:'setting')}"> Setting </a>
        					</li>
        					
        					<li>
        						<a href="${createLink(controller:'user', action:'logout')}"> Logout </a>
        					</li>
        				</ul>
    				</li>
				</ul>
			</nav>
			
		</div>
		<div class = "post">
			<ul id = "post-list">
				
					<g:if test="${blogs == null}">
					
							<li id = "first-post">No post</li>
							
					</g:if>
					<g:else>

						<g:each var = "blog" in="${blogs}">

					   		   <g:if test="${blog == blogs.first()}">
									<li id = "first-post">
										<p>${blog.title}</p>
										<p>${blog.content}</p>
										<p>${blog.createTime}</p>
										<p>${blog.username}</p>
									</li>
								</g:if>
								<g:else>
									<li id = "">
								    	<p>${blog.title}</p>
										<p>${blog.content}</p>
										<p>${blog.createTime}</p>
										<p>${blog.username}</p>
									</li>
								</g:else>
						</g:each>
					</g:else>

				
			</ul>
		</div>
	</body>

</html>


