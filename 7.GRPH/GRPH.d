#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #7: GRPH
// Fredrik Boulund 2012
import std.stdio;
import std.string;
import fbfasta; // My own FASTA reader module

bool checkKOverlap(int k, string sequence1, string sequence2) 
{
	if(sequence1 == sequence2)
	{
		return false;
	}
	if(sequence1[0..k] == sequence2[$-k..$])
	{
		return true;
	}
	else
	{
		return false;
	}
}

int main(string[] args)
{
	if(args.length < 2)
	{
		write("Checks for an overlap of k=3 between all pairs of reads in a");
		writeln("FASTA file. Default k=3.");
		writeln("usage: GRPH.d <fastafile>");
		return 0;
	}
	int k = 3;
	FastaStruct[] fastaRecords;
	fastaRecords = parseFasta(args[1]);
	
	foreach(record1; fastaRecords)
	{
		foreach(record2; fastaRecords)
		{
			if(checkKOverlap(k,  record1.sequence, record2.sequence))
			{
				// Output a connection between them in reverse order
				// Does not write the '>' in the header line
				writefln("%s %s", record2.header[1..$], record1.header[1..$]);
			}
		}
	}

	return 0;
}
