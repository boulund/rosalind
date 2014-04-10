module fbbio;
// Written in the D programming language
// Bioinformatics module for D, 
// simple implementations of common bioinformatics problems.
// Fredrik Boulund 2012
import std.stdio;
import std.string; 

/*
 * Return reverse complement of DNA string.
 * Assumes upper case and nothing but correct DNA bases.
 */
string revcomp(ref string sequence)
{
	char[char] complements = ['A':'T', 'T':'A', 'G':'C', 'C':'G'];
	char[] revcomp = cast(char[]) sequence.idup; 

	// Go through the sequence now stored in revcomp
	// and replace each nucleotide with its complement.
	foreach(i, ref nucleotide; revcomp) 
	{
		nucleotide = complements[nucleotide];
	}
	return cast(string) revcomp.reverse;
}

/*
 * Computes GC content of a string.
 * Assumes everything is in upper case.
 */
float computeGC(string sequence) {
	float gc = 0;
	foreach(nucleotide; sequence) {
		if( (nucleotide == 'G') | (nucleotide == 'C'))
			gc++;
	}
	return (gc/sequence.length);
}

/+
/*
 * DNA codon translation table
 */
char[string] DNAcodons = [
	"TTT": 'F', "CTT": 'L', "ATT": 'I', "GTT": 'V',
	"TTC": 'F', "CTC": 'L', "ATC": 'I', "GTC": 'V',
	"TTA": 'L', "CTA": 'L', "ATA": 'I', "GTA": 'V',
	"TTG": 'L', "CTG": 'L', "ATG": 'M', "GTG": 'V',
	"TCT": 'S', "CCT": 'P', "ACT": 'T', "GCT": 'A',
	"TCC": 'S', "CCC": 'P', "ACC": 'T', "GCC": 'A',
	"TCA": 'S', "CCA": 'P', "ACA": 'T', "GCA": 'A',
	"TCG": 'S', "CCG": 'P', "ACG": 'T', "GCG": 'A',
	"TAT": 'Y', "CAT": 'H', "AAT": 'N', "GAT": 'D',
	"TAC": 'Y', "CAC": 'H', "AAC": 'N', "GAC": 'D',
	"TAA": '*', "CAA": 'Q', "AAA": 'K', "GAA": 'E',
	"TAG": '*', "CAG": 'Q', "AAG": 'K', "GAG": 'E',
	"TGT": 'C', "CGT": 'R', "AGT": 'S', "GGT": 'G',
	"TGC": 'C', "CGC": 'R', "AGC": 'S', "GGC": 'G',
	"TGA": '*', "CGA": 'R', "AGA": 'R', "GGA": 'G',
	"TGG": 'W', "CGG": 'R', "AGG": 'R', "GGG": 'G'];

/*
 * RNA codon translation table
 */
char[string] RNAcodons = [
	"UUU":'F', "UUC":'F', "UUA":'L', "UUG":'L', "UCU":'S', 
	"UCC":'S', "UCA":'S', "UCG":'S', "UAU":'Y', "UAC":'Y', 
	"UAA":'*', "UAG":'*', "UGU":'C', "UGC":'C', "UGA":'*', 
	"UGG":'W', "CUU":'L', "CUC":'L', "CUA":'L', "CUG":'L', 
	"CCU":'P', "CCC":'P', "CCA":'P', "CCG":'P', "CAU":'H', 
	"CAC":'H', "CAA":'Q', "CAG":'Q', "CGU":'R', "CGC":'R', 
	"CGA":'R', "CGG":'R', "AUU":'I', "AUC":'I', "AUA":'I', 
	"AUG":'M', "ACU":'T', "ACC":'T', "ACA":'T', "ACG":'T', 
	"AAU":'N', "AAC":'N', "AAA":'K', "AAG":'K', "AGU":'S', 
	"AGC":'S', "AGA":'R', "AGG":'R', "GUU":'V', "GUC":'V', 
	"GUA":'V', "GUG":'V', "GCU":'A', "GCC":'A', "GCA":'A', 
	"GCG":'A', "GAU":'D', "GAC":'D', "GAA":'E', "GAG":'E', 
	"GGU":'G', "GGC":'G', "GGA":'G', "GGG":'G'];
+/
