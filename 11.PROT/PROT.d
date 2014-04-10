#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #11: PROT
// Fredrik Boulund 2012
import std.stdio;

void main(string[] args)
{
	auto sequence = readln();
	char[string] table = [
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

	for(int pos; pos < sequence.length-3; pos+=3)
	{
		//writefln("%s %s %s", pos, sequence[pos..pos+3], table[sequence[pos..pos+3]]);
		write(table[sequence[pos..pos+3]]);
	}
	writeln();
}

/* 
 * Genetic code formatted for insertion into associative array
 * FROM WIKIPEDIA; I.E. INCORRECT FOR THIS PROBLEM
	"TTT":'F', "TTC":'F', "TTA":'L', "TTG":'L', "CTT":'L', "CTC":'L',
	"CTA":'L', "CTG":'L', "ATT":'I', "ATC":'I', "ATA":'I', "ATG":'M',
	"GTT":'V', "GTC":'V', "GTA":'V', "GTG":'V', "TCT":'S', "TCC":'S',
	"TCA":'S', "TCG":'S', "CCT":'P', "CCC":'P', "CCA":'P', "CCG":'P',
	"ACT":'T', "ACC":'T', "ACA":'T', "ACG":'T', "GCT":'A', "GCC":'A',
	"GCA":'A', "GCG":'A', "TAT":'Y', "TAC":'Y', "TAA":'*', "TAG":'*',
	"CAT":'H', "CAC":'H', "CAA":'Q', "CAG":'Q', "AAT":'N', "AAC":'N',
	"AAA":'K', "AAG":'K', "GAT":'D', "GAC":'D', "GAA":'E', "GAG":'E',
	"TGT":'C', "TGC":'C', "TGA":'*', "TGG":'W', "CGT":'R', "CGC":'R',
	"CGA":'R', "CGG":'R', "AGT":'S', "AGC":'S', "AGA":'R', "AGG":'R',
	"GGT":'G', "GGC":'G', "GGA":'G', "GGG":'G'
 */
