#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #12: REVP
// Fredrik Boulund 2012
import std.stdio;
import std.string; // chomp

string revcomp(ref string sequence)
{
	char[char] complements = ['A':'T', 'T':'A', 'G':'C', 'C':'G'];
	char[] revcomp = cast(char[]) sequence.idup; 

	// Go through the sequence now stored in revcomp
	// and replace each nucleotide with its complement.
	foreach(i, ref nucleotide; revcomp) 
	{
		nucleotide = complements[nucleotide];
	}
	return cast(string) revcomp.reverse;
}

void main(string[] args)
{
	// Read one line from stdin and remove trailing newlines (delimiters)
	auto sequence = readln().chomp();

	/*
	 * For each position in the sequence, check if there is a
	 * palindrome of length between 4-12 that starting at this position.
	 */
	foreach(pos, nucleotide; sequence)
	{
		/*
		 * Continue checking for each length 4-12 until length is 
		 * longer than remaining sequence length.
		 */
		for(int len = 4; pos+len-1 < sequence.length; len++)
		{
			if(len < 13)
			{
				// Check if palindrome
				if(revcomp(sequence[pos..pos+len]) == sequence[pos..pos+len])
					writefln("%s %s", pos+1, len);
			}
		}
	}
}
