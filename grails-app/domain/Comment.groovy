class Comment{


	String comment 
	String author	

	static belongsTo = [blog: Blog]

	static constraints = {
		comment blank: false
		author blank: false
		blog nullable: false
	}
}