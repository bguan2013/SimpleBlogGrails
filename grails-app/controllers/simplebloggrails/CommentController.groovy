package simplebloggrails

class CommentController {

    def index() { }


    def savecomment(){

    	/*parameters for Ajax communication

    		name: comment
			name: author
			name: blogtitle
		*/	
		String comment = params["comment"]
		String author = params["author"]
		String blogTitle = params["blogtitle"]

		println comment + " " + author + " " + blogTitle

		Blog blog = Blog.findByTitle(blogTitle)

		if(blog != null){
			new Comment(comment: comment, author: author, blog: blog).save()
			render comment
		}

		else{
			render 'failed'
		}
		

    }
}
