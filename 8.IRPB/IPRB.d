#!/usr/bin/env rdmd
// Programmed in the D language
// Rosalind problem #8: IPRB
// Fredrik Boulund 2013
import std.stdio;
import std.string;
import std.conv;

void main() {
	auto input = readln().chomp();
	auto k = parse!uint(input);
	munch(input, " ");
	auto m = parse!uint(input);
	munch(input, " ");
	auto n = parse!uint(input);

	auto totalCombinations = nchoosek(k+m+n, 2);

	/*
	 * The following combinations will yield offspring with 
	 * dominant alleles (and thus dominant phenotype):
	 * kk (all)
	 * km (all)
	 * kn (all)
	 * mm (3/4)
	 * mn (2/4)
	 * nn (none)
	 */
	auto numDominantPhenotype = nchoosek(k,2) + 
								nchoosek(k,1) * nchoosek(m,1) +
								nchoosek(k,1) * nchoosek(n,1) +
								cast(double) nchoosek(m,2) * 3/4 + 
								cast(double) nchoosek(m,1) * nchoosek(n,1) * 1/2;

	writeln(numDominantPhenotype / totalCombinations);
}

/*
 * NchooseK implementation inspired by MATLAB's implementation.
 * MUCH better than my previous implementation with factorials.
 * (e.g. it actually works without ulong overflows)
 */
double nchoosek(ulong n, ulong k) {
	double[] nums = new double[k];
	double[] dens = new double[k];
	/*
	 * Fill each array with values 
	 * nums = (n-k+1) .. n
	 * dens = 1 .. k
	 */
	foreach(i, ref value; nums) { value = (n-k+1)+i; }
	foreach(i, ref value; dens) { value = i+1; }

	nums[] = nums[] / dens[]; // Element wise divison

	// Compute product sum of nums and return 
	double prod = 1;
	foreach(ref value; nums) { prod *= value; }
	return prod;
}
