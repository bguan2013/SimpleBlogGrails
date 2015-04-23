class User{


	String username
	String password

	static constraints = {
		username blank: false, size: 7..20, unique: true, email: true;
		password blank: false, size: 7..20
	}

}