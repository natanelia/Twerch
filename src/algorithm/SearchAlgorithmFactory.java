package algorithm;

public class SearchAlgorithmFactory {

    public static SearchAlgorithm createInstance(String type) {
        if (type.equals("BM")) {
            return new BM();
        } else {
            return new KMP();
        }
    }

}
