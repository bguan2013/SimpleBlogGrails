package simplebloggrails

class UserController {

    def index() { 
        
    }

    def logout(){

        session.invalidate()
        redirect(controller:'user', action:'login')
    }

    def login(){

    	String loggedUser = session["loggedUser"]

    	if(loggedUser == "" || loggedUser == null){

            String notification
    		String username = params["user_name"]
            String password = params["password"]


            if(username == null || password == null){
                [notification: null]
            }

            else if(username == "" || password == ""){

                notification = "Please enter in both fields!"

                //name of the gsp variable : the value passed inside
                [notification:notification]
            }
            else{
                User temp = User.findByUsername(username)
                if(temp == null){
                    notification = "This user doesn't exist!"
                    [notification:notification]
                }
                else{
                    if(temp.password != password){
                        notification = "Wrong password!"
                        [notification:notification]
                    }
                    else{
                        //Passed identification check
                        session["loggedUser"] = username
                        redirect(controller: 'blog', action: 'viewblog')
                    }

                }
            }

    	}
    	else{

            redirect(controller: 'blog', action: 'viewblog')
    		
    	}
    }

    def register(){

        String loggedUser = session["loggedUser"]

        if(loggedUser == "" || loggedUser == null){

            String notification
            String username = params["user_name"]
            String password = params["password"]

            if(username == null || password == null){
                [notification: null]
            }

            else if(username == "" || password == ""){

                notification = "Please enter in both fields!"

                //name of the gsp variable : the value passed inside
                [notification: notification]
            }

            else{
                
                if(User.findByUsername(username) == null){
                    
                    new User(username: username, password: password).save()
                    session["loggedUser"] = username 
                    redirect(controller: 'blog', action: 'viewblog')

                    
                }
                else{
                    //User exists
                    notification = "User exists!"
                    [notification: notification]
                }
            }

        }
        else{

            redirect(controller: 'blog', action: 'viewblog')
            
        }

    }
}
