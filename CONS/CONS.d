#!/usr/bin/env rdmd
// Programmed in the D programming language
// Fredrik Boulund 2013
// Rosalind problem: CONS
// Consensus and Profile

import std.stdio;
import std.string;
import std.conv;

void main() {
	string[] sequences;
	uint counter;
	
	/*
	 * Read stdin line by line and store strings in array of strings
	 */
	foreach(line; stdin.byLine) {
		counter++;
		sequences.length = counter; // Dynamic expansion, slow
		sequences[counter-1] = to!string(line);
	}

	// Profile matrix where each row represents A, C, G, T, respectively.
	uint[][4] profile;  // The indexing is backwards when assigning!
	char[] rowOrder = ['A', 'C', 'G', 'T'];

	// Extend the matrix with run-time information of sequence lengths
	foreach(i, ref row; profile) {
		row = new uint[sequences[i].length]; 
	}

	/*
	 * Populate the profile based on the position of the maximum
	 * number in each column.
	 */
	for(uint pos=0; pos < sequences[0].length; pos++) {
		for(uint num=0; num < counter; num++) {
			switch (sequences[num][pos]) {
				case 'A':
					profile[0][pos]++;
					break;
				case 'C':
					profile[1][pos]++;
					break;
				case 'G':
					profile[2][pos]++;
					break;
				case 'T':
					profile[3][pos]++;
					break;
				default:
					break;
			}
		}	
	}

	/*
	 * Write the consensus sequence based on the now populated profile.
	 */
	for(uint col=0; col < profile[0].length; col++) {
		auto column = [profile[0][col],
					profile[1][col],
					profile[2][col],
					profile[3][col]];
		switch ( maxPos(column) ) {
			case 0:
				write("A");
				break;
			case 1:
				write("C");
				break;
			case 2:
				write("G");
				break;
			case 3:
				write("T");
				break;
			default:
				break;
		}
	}
	writeln();

	
	// Print the profile after the consensus sequence.
	foreach(i, ref row; profile) {
		writef("%s:", rowOrder[i]);
		foreach(ref num; row) {
			writef(" %s", num);
		}
		writeln();
	}

}

/*
 * Little helper function that returns the position of 
 * the largest number in an array. It is a template function
 * and thus accepts most types. Reusable!
 * (Couldn't figure out how to use std.algorithm.minPos for my needs)
 */
uint maxPos(T)(ref T a) {
	uint maxpos;
	auto max = a[0];
	foreach(i, num; a) {
		if(num > max) {
			max = num;
			maxpos = cast(uint) i;
		}
	}
	return maxpos;
}
