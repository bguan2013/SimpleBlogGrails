

<html>
	<head>
		<asset:stylesheet href="BlogPageStyleSheet.css"/>
		<title>Blog Page</title>
		<script type="text/javascript">
			var xmlHttp1 = new XMLHttpRequest();
			var gComment = "";
			var gCommentAreaNode;
			function saveComment(comment, username, blogtitle, comment_area){

				gComment = comment;
				gCommentAreaNode = comment_area;
				var sendComment = "comment=" + comment + "&author=" + username + "&blogtitle=" + blogtitle;		

				xmlHttp1.open("Post", "/comment/savecomment?" + sendComment, true);		
				xmlHttp1.onreadystatechange = displayComment;	
				xmlHttp1.send();
			}
			function displayComment(){
				if(xmlHttp1.readyState == 4 && xmlHttp1.status == 200){
					console.log(xmlHttp1.responseText);
					var nodeP = document.createElement("li");
					nodeP.appendChild(document.createTextNode(xmlHttp1.responseText));
					gCommentAreaNode.appendChild(nodeP);
				}
				else{
					console.log("Ready State is: " + xmlHttp1.readyState + " Status is: " + xmlHttp1.status);
				}
			}
			function getNewBlogs(index){

				var xmlHttp2 = new XMLHttpRequest();
				xmlHttp2.onreadystatechange = function(){

					//Inorder to use JSON with AJAX, we need to use the third party library JQuery
					var json = xmlHttp2.responseXML;


				}
				xmlHttp2.open("Post","/blog/oldblogs",true);
				xmlHttp2.send(index);
			}

			

		</script>
	</head>
	<body>
		
		<g:img id = "header_background" dir="images" file = "waterDrop.jpg"/>
		<div class = "header">
			<a href="${createLink(action: 'writeblog')}" id = "write_button"></a>
			<a href="${createLink(controller: 'rss', action: 'rssnews')}" id = "rss_button"></a>
			

			<div id = "username">${username}</div>
		
			
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
				
					<g:if test="${blogs.size() == 0}">
					
							<li id = "first-post">No post</li>
							
					</g:if>
					<g:else>

						<g:each var = "blog" in="${blogs}">

					   		   <g:if test="${blog == blogs.first()}">
									<li id = "first-post">
										<p name = "blog_title">${blog.title}</p>
										<p name = "blog_content">${blog.content}</p>
										<p name = "blog_time">${blog.createTime}</p>
										<p name = "blog_user">${blog.username}</p>
										<br>
										<p class = "comment_tag">Comments</p>
										<ul class = "comment_area" name = "comment_area">
											
											<g:each var = "comment" in="${blog.comments}">
												<li>${comment.comment}</li>
											</g:each>
										</ul>
										<br>
										<form>
											<input class = "comment" type = "text" name = "comment">
											
											<input class = "comment_button" type = "button" value = "comment" onclick="saveComment(this.form.comment.value, document.getElementById('username').innerHTML,  this.form.parentNode.children['blog_title'].innerHTML, this.form.parentNode.children['comment_area']); this.form.comment.value = ''">

											
										</form>
									</li>
								</g:if>
								<g:else>
									<li id = "">
								    	<p name = "blog_title">${blog.title}</p>
										<p name = "blog_content">${blog.content}</p>
										<p name = "blog_time">${blog.createTime}</p>
										<p name = "blog_user">${blog.username}</p>
										<br>
										<p class = "comment_tag">Comments</p>
										<ul class = "comment_area" name = "comment_area">
											
											<g:each var = "comment" in="${blog.comments}">
												<li>${comment.comment}</li>
											</g:each>
										</ul>
										<br>
										<form>
											<input class = "comment" name = "comment" type = "text">
											<input class = "comment_button" type = "button" value = "comment" onclick="saveComment(this.form.comment.value, document.getElementById('username').innerHTML, this.form.parentNode.children['blog_title'].innerHTML, this.form.parentNode.children['comment_area']); this.form.comment.value = ''">

											
										</form>
									</li>
								</g:else>
						</g:each>
					</g:else>

				
			</ul>
		</div>

		<script type="text/javascript">
			function test(element){

					if(element == null){
						console.log("Doesn't exist");
					}
					else{
						for(node in element.children){
							console.log(node);
						}
						console.log(element.children["comment_area"].innerHTML);

					}

			}
		</script>
	</body>

</html>


