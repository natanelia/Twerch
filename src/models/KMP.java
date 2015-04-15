import java.util.*;

/**
* Knuth-Morris-Pratt Algorithm for string mathcing
*/
public class KMP
{
	/**
	* Get longest proper prefix suffix
	*/
	private static int[] lps(String pattern)
	{
		int len = 0;
		int i = 1;
		int m = pattern.length();
		int lps[] = new int[m];
		lps[0] = 0;
		
		while (i < m)
		{
			if (pattern.charAt(i) == pattern.charAt(len))
			{
				len++;
				lps[i] = len;
				i++;
			}else if (len > 0)
			{
				len = lps[len-1];
			}else
			{
				lps[i] = 0;
				i++;
			}
		}
		return lps;
	}
	
	/**
	* Find matched pattern inside text
	* @param 	text 					Text to be searched from
	* @param 	pattern 				Text to be searched for
	* @return 	Pair<Boolean, ArrayList<Integer> > 	All matched indexes
	*/
	public static Pair< Boolean, ArrayList<Integer> > find(String text, String pattern)
	{
		int lps[] = lps(pattern);
		int n = text.length();
		int m = pattern.length();
		ArrayList<Integer> idxs = new ArrayList<Integer>();
		
		// i : index of current position in text
		// j : index of current position in pattern
		int i = 0;
		int j = 0;
		
		if (m > n)
		{
			return new Pair<Boolean, ArrayList<Integer> >(false, new ArrayList<Integer>());
		}
		
		while (i < n)
		{
			if (text.charAt(i) == pattern.charAt(j))
			{
				if (j == m-1)
				{
					idxs.add(i - m + 1);
					j = lps[j-1];
				}else
				{
					i++;j++;
				}
			}else if (j > 0)
			{
				j = lps[j-1];
			}else
			{
				i++;
			}
		}
		
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