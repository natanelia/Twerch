package models;

public class TweetObject {

    private String displayName;
    private String tweetContent;

    public TweetObject(String displayName,String  tweetContent) {
        this.displayName = displayName;
        this.tweetContent = tweetContent;
    }

    public String getDisplayName() {
        return displayName;
    }

    public String getTweetContent() {
        return tweetContent;
    }

}
