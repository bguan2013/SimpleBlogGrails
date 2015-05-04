class Rss{
	
	String rssTitle
	String rssAuthor
	String rssDescription
	String rssDate

	static constraints = {
		rssTitle nullable: false, unique: true;
		rssAuthor nullable: false
		rssDescription nullable: false
		rssDate nullable: false

	}
}