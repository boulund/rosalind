#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #1: DNA
// Fredrik Boulund 2012
import std.stdio;

// Count number of each of the valid nucleotides in sequence and return a
// dictionary with counts for each nucleotide
int[char] countNucleotides(string sequence, char[] nucleotides) {
	int[char] nucleotideCounts;
	foreach(char nucleotide; sequence) {
		foreach(accNuc; nucleotides)
			if(nucleotide == accNuc)
				nucleotideCounts[nucleotide]++;
	}
	return nucleotideCounts;
}

void main() {
	// Define valid nucleotides
	char[] nucleotides = ['A', 'C', 'G', 'T'];
	// Read sequence data from stdin
	auto sequence = readln();
	auto nucleotideCounts = countNucleotides(sequence, nucleotides);
	// Print the numbers of observed nucleotides in sequence in the order 
	// given in the array of valid nucleotides
	foreach(char nucleotide; nucleotides){
		writef("%s ", nucleotideCounts[nucleotide]);
	}
	write("\n");
}



