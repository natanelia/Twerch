package models;
public class Category {
    private final String[] categories = {
            "Film",
            "Musik",
            "Sepak Bola"
    };

    private int selectedCategoryId = 0;

    public String[] getCategories() {
        return categories;
    }

    public int getSelectedCategoryId() {
        return selectedCategoryId;
    }

    public void setSelectedCategoryId(int selectId) {
        selectedCategoryId=selectId;
    }
}