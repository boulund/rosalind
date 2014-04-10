#!/usr/bin/env rdmd
// Programmed in the D language
// Rosalind problem #10: PERM
// Fredrik Boulund 2012
import std.stdio;
import std.conv;
import std.string;
static import fbmath;


void printPermutations(uint n) 
{
	uint[] numbers;
	numbers.length = n;
	for(uint i = 0; i < n; i++)
	{
		numbers[i] = i+1;
	}

	uint[] permutation = numbers.dup;
	for(auto i = 0; i < fbmath.factorial(n); i++)
	{
		
		// Write the current permutation
		foreach(number; permutation)
		{
			writef("%s ", number);
		}
		writeln();

		/*
		 * FIND THE LEXICOGRAPHICALLY NEXT PERMUTATION
		 * Search the array from the right and look for
		 * the position of the number that has a larger 
		 * number to the right. Call this element the pivot.
		 * If it reaches the end of the array, reverse the array.
		 */
		uint pivotPos = 0;
		uint pivot = 0;
		bool noBreak = true;
		for(auto j = 1; j < (permutation.length); j++)
		{
			if(permutation[$-j-1] < permutation[$-j])
			{
				pivot = permutation[$-j-1];
				pivotPos = to!uint((permutation.length-j-1));
				noBreak = false;
				break;
			}
		}
		if(noBreak)
		{
			pivot = permutation[0];
			pivotPos = to!uint(permutation.length-1);
			permutation.reverse;
		}

		/*
		 * Then look again from the right for the number
		 * larger than the pivot. 
		 * Call this the swap.
		 */
		uint swap = 0;
		uint swapPos = 0;
		for(auto k = 1; k < (permutation.length); k++)
		{
			if(permutation[$-k] > pivot)
			{
				swap = permutation[$-k];
				swapPos = to!uint(permutation.length-k);
				break;
			}
		}
		
		/*
		 * Then exchange the pivot and swap elements
		 * and reverse the array to the right of the pivot.
		 */
		permutation[pivotPos] =  swap;
		permutation[swapPos] = pivot;
		permutation[pivotPos+1 .. $].reverse;
	}
}



void main() 
{
	uint n = to!uint(readln().chomp());
	writeln(fbmath.factorial(n));
	printPermutations(n);
}
