#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #6: SUBS
// Fredrik Boulund 2012
import std.stdio;
import std.string;


// Check if current position is a substring
bool checkSubstring(string sequence, string substring)
{
	foreach(i, nuc; substring)
	{
		if(nuc != sequence[i])
		{
			return false;
		}
	}
	return true;
}

void main()
{
	// Read two lines from stdin
	auto sequence1 = readln().chomp();
	auto sequence2 = readln().chomp();

	// The code assumes the second sequence is possibly a substring of #1.
	foreach(i, nucleotide; sequence1)
	{
		// Check if substring starts at this position
		if(checkSubstring(sequence1[i..$], sequence2))
		{
			writef("%s ", i+1);
		}

	}
}
