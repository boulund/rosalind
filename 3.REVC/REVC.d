#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #3: REVC
// Fredrik Boulund 2012
import std.stdio;
import std.string;

void main() {
	char[char] complements = ['A': 'T', 'T': 'A', 'G': 'C', 'C': 'G'];
	// Read sequence data from stdin into a mutable char array
	auto sequence = cast(char[]) readln().stripRight();
	sequence.reverse;
	foreach(nucleotide; sequence) {
		write(complements[nucleotide]);
	}
	write("\n");
}
