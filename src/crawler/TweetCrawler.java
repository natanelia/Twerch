package crawler;

import twitter4j.*;
import twitter4j.conf.Configuration;
import twitter4j.conf.ConfigurationBuilder;

import java.util.List;

/**
 * Created by vincentsthe on 15/04/15.
 */
public class TweetCrawler {

    Twitter twitter;

    public TweetCrawler() {
        twitter = TwitterFactory.getSingleton();
        twitter.setOAuthConsumer("tar3HZAj35eLfEQtlo1hdotnx", "zgKYav5bbH5yWVDjeqNmgK4ms588l9J4lLtKoBSJTKDmOxHThE");
    }

    public static void main(String[] args) {
        if (args.length < 1) {
            System.out.println("java twitter4j.examples.search.SearchTweets [query]");
            System.exit(-1);
        }
        Twitter twitter = new TwitterFactory(cresidential().build()).getInstance();
        try {
            Query query = new Query(args[0]);
            QueryResult result;
            do {
                result = twitter.search(query);
                List<Status> tweets = result.getTweets();
                for (Status tweet : tweets) {
                    System.out.println("@" + tweet.getUser().getScreenName() + " - " + tweet.getText());
                }
            } while ((query = result.nextQuery()) != null);
            System.exit(0);
        } catch (TwitterException te) {
            te.printStackTrace();
            System.out.println("Failed to search tweets: " + te.getMessage());
            System.exit(-1);
        }
    }

    private static ConfigurationBuilder cresidential() {
        return new ConfigurationBuilder().setDebugEnabled(true)
                                        .setOAuthConsumerKey("tar3HZAj35eLfEQtlo1hdotnx")
                                        .setOAuthConsumerSecret("zgKYav5bbH5yWVDjeqNmgK4ms588l9J4lLtKoBSJTKDmOxHThE")
                                        .setOAuthAccessToken("1348353366-YrNeQFmTwvWxAh9bXipD3CPbA0n8oMuKcDTFDQq")
                                        .setOAuthAccessTokenSecret("viR44VJLbEWQ0fh90WaSfSXGXThmG7mFqQsvKbGrb4MIo");
    }

}
