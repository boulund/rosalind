module fbmath;
// Written in the D programming language
// Simple math library with probability and math functions.
// Inefficient implementations.
// Fredrik Boulund 2012
import std.stdio;

ulong factorial(ulong n)
{
    if(n < 2)
        return 1;
    else
        return n * factorial(n - 1);
}
	
/*
 * NchooseK implementation inspired by MATLAB's implementation.
 * MUCH better than my previous implementation with factorials.
 * (e.g. it actually works without ulong overflows)
 */
ulong nchoosek(ulong n, ulong k) {
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
