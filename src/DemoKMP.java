import algorithm.KMP;
import algorithm.Pair;

import java.util.*;

public class DemoKMP
{
	public static void main(String[] args)
	{
		if (args.length != 2)
		{
			System.out.println("Usage: Java DemoKMP <text> <pattern>");
			System.exit(0);
		}
		
		long startTime = System.nanoTime();
		KMP kmp = new KMP();
		Pair<Boolean, ArrayList<Integer>> res = kmp.find(args[0], args[1]);
		long endTime = System.nanoTime();
		double duration = (double)(endTime - startTime)/1000000;
		
		if (res.getFirst() == false)
		{
			System.out.println("Pattern not found");
		}
		else
		{
			ArrayList<Integer> elements;
			elements = res.getSecond();
			for (int i = 0; i < elements.size(); i++) {
				    int value = elements.get(i);
				    System.out.println("Element: " + value);
				}
		}
		
		System.out.printf("Time: %.3fms\n", duration);
	}
}