package simplebloggrails

class SettingController {

    def index() { }

    def setting(){



    }

    def verify_setting(){

    	String username = session["loggedUser"]
    	User user = User.findByUsername(username)

    	String oldPasswordAttempt = params["old_password"]
    	String newPasswordAttempt = params["new_password"]
    	String confirmPasswordAttempt = params["confirm_password"]

    	if(user.password == oldPasswordAttempt){
    		if(newPasswordAttempt == confirmPasswordAttempt){

    			user.password = newPasswordAttempt
    			user.save()

    			redirect(controller:'blog', action:'viewblog')
    		}
    		else{
    			[notification:"New passwords do not match!"]
    			redirect(action:'setting')
    		}
    	}

    	else{
    		[notification:"Old Password Wrong!"]
    		redirect(action:'setting')
    	}


    }
}
