package algorithm;

import java.util.*;

/**
* Boyer - Moore Algorithm for string mathcing
*/
public class BM implements SearchAlgorithm
{
	/**
	* Get last index of each characters in pattern
	*/
	public int[] getLasts(String pattern)
	{
		int res[] = new int[128];
		
		for (int i = 0;i < 128;i++)
		{
			res[i] = -1;
		}
		
		for (int i=0;i < pattern.length();i++)
		{
			res[pattern.charAt(i)] = i;
		}
		
		return res;
	}
	
	/**
	* Find matched pattern inside text
	* @param 	text 					Text to be searched from
	* @param 	pattern 				Text to be searched for
	* @return 	algorithm.Pair<Boolean, ArrayList<Integer> > 	All matched indexes
	*/
	@Override
	public Pair< Boolean, ArrayList<Integer> > find(String text, String pattern)
	{
		int lastIdxs[] = getLasts(pattern);
		int n = text.length();
		int m = pattern.length();
		ArrayList<Integer> idxs = new ArrayList<Integer>();
		
		// i : index of current position in text
		// j : index of current position in pattern
		int j = m-1;
		int i = j;
		
		if (i > n-1)
		{
			return new Pair<Boolean, ArrayList<Integer> >(false, new ArrayList<Integer>());
		}
		
		do
		{
			if (pattern.charAt(j) == text.charAt(i))
			{
				if (j==0) // matched whole pattern
				{
					idxs.add(i);
					int lastIdx = lastIdxs[text.charAt(i)];
					i += m - Math.min(j, 1 + lastIdx);
					j = m - 1; 
				}
				else
				{
					i--;j--;
				}
			}else
			{
				int lastIdx = lastIdxs[text.charAt(i)];
				i += m - Math.min(j, 1 + lastIdx);
				j = m - 1; 
			}
		}while (i <= n-1);
	
		if (idxs.size() == 0)
		{
			return new Pair<Boolean, ArrayList<Integer> >(false, new ArrayList<Integer>());
		}
		else
		{
			return new Pair<Boolean, ArrayList<Integer> >(true, idxs);
		}	
	}
}