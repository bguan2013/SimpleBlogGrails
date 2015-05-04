

<!doctype html>

<html>
	<head>
		<asset:stylesheet href="RSSNewsPageStyleSheet.css"/>
		<title>News Page</title>
	</head>
	<body>
		<g:img id = "header_background" dir = "images" file = "waterDrop.jpg"/>
		<div class = "header">
			<a href="${createLink(controller: 'blog', action: 'writeblog')}" id = "write_button"></a>
			<a href="${createLink(controller: 'blog', action: 'viewblog')}" id = "blog_button"></a>
		

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
				
				<g:if test="${rssList.size() == 0}">
					<li id = "first-post">No post</li>
				</g:if>
			    
			    <g:else>

						<g:each var="rss" in="${rssList}">

					   		   <g:if test="${rss == rssList.first()}">
									<li id = "first-post">
										<p>${rss.rssTitle}</p>
										<p>${raw(rss.rssDescription)}</p>
										<p>${rss.rssDate}</p>
										<p>${rss.rssAuthor}</p>
									</li>
								</g:if>
								<g:else>
									<li id = "">
										<p>${rss.rssTitle}</p>
										<p>${raw(rss.rssDescription)}</p>
										<p>${rss.rssDate}</p>
										<p>${rss.rssAuthor}</p>
									</li>
								</g:else>
						
						</g:each>					
				</g:else>
			
			</ul>
		</div>
	</body>

</html>