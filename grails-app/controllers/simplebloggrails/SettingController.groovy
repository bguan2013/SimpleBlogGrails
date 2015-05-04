package simplebloggrails

class SettingController {

    def index() { }

    def setting(){
        if(session["loggedUser"] == null){
            redirect(controller: 'user', action: 'login')
        }
        else{
            render(view: 'setting')
        }


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
    			
    			redirect(action:'setting', params:[notification:"New passwords do not match!"])
    		}
    	}

    	else{
    		
    		redirect(action:'setting', params: [notification:"Old Password Wrong!"])
    	}


    }
}
