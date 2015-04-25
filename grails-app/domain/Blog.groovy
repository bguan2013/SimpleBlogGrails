class Blog{

	String title
	String content
	Date createTime
	String username

	static hasMany = [comments: Comment]

	static constraints = {
		title blank: false, unique: true
		content blank: false
		comments nullable: true
		
	}


}