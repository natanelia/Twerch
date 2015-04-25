package crawler;

import algorithm.Pair;
import algorithm.SearchAlgorithm;
import algorithm.SearchAlgorithmFactory;
import models.CategoryKeywords;
import models.CategoryResult;
import models.TweetObject;

import java.util.ArrayList;
import java.util.List;

public class twerchCrawler {

    public twerchCrawler() {}

    /**
     * algorithm string is one of 'KMP' or 'BM'
     */
    public List<CategoryResult> getResult(String keyword, List<CategoryKeywords> categoryList, String algorithm) {
        List<CategoryResult> result = new ArrayList<CategoryResult>();
        SearchAlgorithm stringMatcher = SearchAlgorithmFactory.createInstance(algorithm);
        List<TweetObject> tweetList = new TweetCrawler().crawlByKeyword(keyword);

        for (CategoryKeywords categoryKeywords : categoryList) {
            result.add(new CategoryResult(categoryKeywords.getCategoryName(), new ArrayList<TweetObject>()));
        }
        result.add(new CategoryResult("Unknown", new ArrayList<TweetObject>()));

        for (TweetObject tweet : tweetList) {
            int categoryIndex = -1;
            int stringFoundIndex = 1000000;
            for (int i = 0; i < categoryList.size(); ++i) {
                for (String categoryKeyword : categoryList.get(i).getKeywordList()) {
                    Pair<Boolean, ArrayList<Integer>> res = stringMatcher.find(tweet.getTweetContent(), categoryKeyword);
                    if (res.first && res.second.get(0)<stringFoundIndex) {
                        categoryIndex = i;
                        stringFoundIndex = res.second.get(0);
                    }
                }
            }

            if (categoryIndex != -1) {
                result.get(categoryIndex).getTweets().add(tweet);
            } else {
                result.get(result.size()-1).getTweets().add(tweet);
            }
        }

        return result;
    }

}
