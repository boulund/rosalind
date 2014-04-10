#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #5: HAMM
// Fredrik Boulund 2012
import std.stdio;

void main()
{
	// Read two lines from stdin
	auto sequence1 = readln();
	auto sequence2 = readln();

	// The code assumes both sequences are equal in length
	int hamming = 0;
	foreach(i, nucleotide; sequence1)
	{
		if (nucleotide != sequence2[i])
		{
			hamming++;
		}
	}
	writeln(hamming);
}
