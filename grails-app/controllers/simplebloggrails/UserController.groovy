package simplebloggrails

class UserController {

    def index() { 
        
    }

    def login(){

    	String loggedUser = session["loggedUser"]

    	if(loggedUser == "" || loggedUser == null){

            String notification
    		String username = params["user_name"]
            String password = params["password"]


            if（username == null || password == null）{
                [notification: ""]
            }

            else if(username == "" || password == ""){

                notification = "Please enter in both fields!"

                //name of the gsp variable : the value passed inside
                [notification:notification]
            }
            else{
                
                if(User.findByUsername(username) == null){
                    notification = "This user doesn't exsit!"
                    [notification:notification]
                }
                else{
                    if(User.findByPassword(password) == null){
                        notification = "Wrong password!"
                        [notification:notification]
                    }
                    else{
                        //Passed identification check
                        session["loggedUser"] = username
                        redirect(controller: BlogController, action: viewblog)
                    }

                }
            }

    	}
    	else{

            redirect(controller: BlogController, action: viewblog)
    		
    	}
    }

    def register(){

        String loggedUser = session["loggedUser"]

        if(loggedUser == "" || loggedUser == null){

            String notification
            String username = params["user_name"]
            String password = params["password"]

            if（username == null || password == null）{
                [notification: ""]
            }

            else if(username == "" || password == ""){

                notification = "Please enter in both fields!"

                //name of the gsp variable : the value passed inside
                [notification: notification]
            }

            else{
                
                if(User.findByUsername(username) == null){
                    
                    session["loggedUser"] = username 
                    redirect(controller: BlogController, action: viewblog)

                    
                }
                else{
                    //User exists
                    notification = "User exists!"
                    [notification: notification]
                }
            }

        }
        else{

            redirect(controller: BlogController, action: viewblog)
            
        }

    }
}
