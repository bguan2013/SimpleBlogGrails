class Blog{

	String title
	String content
	Date createTime
	String username

	static constraints = {
		title blank: false, unique: true
		content blank: false
		
	}


}