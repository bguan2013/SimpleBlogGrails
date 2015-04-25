package simplebloggrails

class BlogController {

    def index() { }

    def viewblog(){

    	String loggedUser = session["loggedUser"]
    	if(loggedUser == "" || loggedUser == null){
    		loggedUser = "unknown"
    	}
        def blogs = Blog.getAll().reverse()
        render(view: 'viewblog', model:[username:loggedUser, blogs:blogs])
        

    }

    def writeblog(){

    	String loggedUser = session["loggedUser"]	
    	if(loggedUser == "" || loggedUser == null){

    		redirect(action: 'viewblog')
    		
    	}
        [username:loggedUser]
    }

    def saveblog(){

        String title = params["blog_title"]
        String content = params["blog_post"]

        if(title != "" && content != ""){
            new Blog(title: title, content: content, createTime: new Date(), username: session["loggedUser"]).save()
        }
        redirect(action: 'viewblog')
        
    }


}
