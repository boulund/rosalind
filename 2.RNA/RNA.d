#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #2: RNA
// Fredrik Boulund 2012
import std.stdio;

void main() {
	// Read sequence data from stdin
	auto sequence = readln();
	foreach(char nucleotide; sequence) {
		if(nucleotide == 'T')
			write('U');
		else 
			write(nucleotide);
	}
	write("\n");
}
