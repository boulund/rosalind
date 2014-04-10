#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #16: MPRT
// Fredrik Boulund 2012
import std.stdio;
import std.string;
import fbfasta;
import std.net.curl;

void main(string[] argv)
{
	File sources = File(argv[1], "r");

	// Container for several FastaRecords
	FastaStruct[][] fastaRecords;
	
	auto test = get("http://www.uniprot.org/uniprot/A2Z669.fasta");

	foreach(line; sources.byLine)
	{
		
	}
}

