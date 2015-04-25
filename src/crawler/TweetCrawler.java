package crawler;

import models.TweetObject;
import twitter4j.*;
import twitter4j.conf.ConfigurationBuilder;

import java.util.ArrayList;
import java.util.List;

public class TweetCrawler {

    Twitter twitter;

    public TweetCrawler() {
        twitter = TwitterFactory.getSingleton();
        //twitter.setOAuthConsumer("tar3HZAj35eLfEQtlo1hdotnx", "zgKYav5bbH5yWVDjeqNmgK4ms588l9J4lLtKoBSJTKDmOxHThE");
    }

    public List<TweetObject> crawlByKeyword(String keyword) {
        Twitter twitter = new TwitterFactory(cresidential().build()).getInstance();
        List<TweetObject> crawlResult = new ArrayList<TweetObject>();
        try {
            Query query = new Query(keyword).count(100);
            QueryResult result = twitter.search(query);
            List<Status> tweets = result.getTweets();
            for (Status tweet : tweets) {
                crawlResult.add(new TweetObject(tweet.getUser().getScreenName(), tweet.getText()));
            }

        } catch (TwitterException e) {
            e.printStackTrace();
            System.out.println("Failed to search tweets: " + e.getMessage());
        }
        return crawlResult;
    }

    private static ConfigurationBuilder cresidential() {
        return new ConfigurationBuilder().setDebugEnabled(true)
                .setOAuthConsumerKey("tar3HZAj35eLfEQtlo1hdotnx")
                .setOAuthConsumerSecret("zgKYav5bbH5yWVDjeqNmgK4ms588l9J4lLtKoBSJTKDmOxHThE")
                .setOAuthAccessToken("1348353366-YrNeQFmTwvWxAh9bXipD3CPbA0n8oMuKcDTFDQq")
                .setOAuthAccessTokenSecret("viR44VJLbEWQ0fh90WaSfSXGXThmG7mFqQsvKbGrb4MIo");
    }

}
