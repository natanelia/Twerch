package models;

import java.util.List;

public class CategoryResult {

    private String categoryName;
    private List<TweetObject> tweets;

    public CategoryResult(String categoryName, List<TweetObject> tweets) {
        this.categoryName = categoryName;
        this.tweets = tweets;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public List<TweetObject> getTweets() {
        return tweets;
    }

}
