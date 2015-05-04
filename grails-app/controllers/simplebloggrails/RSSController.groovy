package simplebloggrails

import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;
import com.sun.syndication.feed.synd.SyndEntry;

class RssController {

    def index() { }

    def rssnews(){


        def rssList = getRSSNewsListWithSize(10)
        render(view: 'rssnews', model: [rssList:rssList, username: session["loggedUser"]])

    }


	    @SuppressWarnings("unchecked")
	        public static List<SyndEntry> getLastestNewsFromYahoo()throws IOException{

	            URL url = new URL("http://rss.news.yahoo.com/rss/us");
	            SyndFeedInput syndFeedInput = new SyndFeedInput();
	            SyndFeed syndFeed = null;
	            XmlReader xmlReader = new XmlReader(url);
	            try{
	                syndFeed = syndFeedInput.build(xmlReader);
	                List<SyndEntry> rss = syndFeed.getEntries();
	                return rss;
	            }
	            catch(IllegalArgumentException e){
	                e.printStackTrace();
	                return null;
	            }
	            catch(FeedException e){
	                e.printStackTrace();
	                return null;
	            }

	    }

        public static List<Rss> getRSSNewsListWithSize(int size){

            List<Rss> rssList = new ArrayList<Rss>();

            try{
                Iterator iterator = getLastestNewsFromYahoo().iterator();
                for(int i = 0; i < size; i++){
                    if(iterator.hasNext()){
                        SyndEntry syndEntry = (SyndEntry)iterator.next();

                        String author = syndEntry.getAuthor();
                        String title = syndEntry.getTitle();
                        String description = syndEntry.getDescription().getValue();
                        String date = syndEntry.getPublishedDate().toString();

                        
                        println author + "\n"

                       
                        //Temporary RSS ID
                        Rss temp = new Rss(rssTitle: title, rssAuthor: author, rssDescription: description, rssDate: date)
                        rssList.add(temp)

                        println temp.rssDescription 
                    }
                }   
                return rssList;
            }
            catch(IOException e){
                e.printStackTrace();
                return null;
            }   
        }
}
