package models;

import java.util.List;

public class CategoryKeywords {

    private String categoryName;
    private List<String> keywordList;

    public CategoryKeywords(String categoryName, List<String> keywordList) {
        this.categoryName = categoryName;
        this.keywordList = keywordList;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public List<String> getKeywordList() {
        return keywordList;
    }

}
