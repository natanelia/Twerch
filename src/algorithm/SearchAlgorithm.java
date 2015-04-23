package algorithm;

import java.util.ArrayList;

public interface SearchAlgorithm {

    public Pair< Boolean, ArrayList<Integer>> find(String text, String pattern);
}
