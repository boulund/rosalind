#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #18: ORF
// Fredrik Boulund 2012
import std.stdio;
import std.string;
static import fbbio;

void main()
{
	string sequence = readln().chomp();

	// Stores a hash of ORF sequences
	byte[string] ORFs;

	// First three reading frames
	findORFs(sequence, ORFs);
	findORFs(sequence[1 .. $], ORFs);
	findORFs(sequence[2 .. $], ORFs);
	// Remaining three reading frames (revcomp)
	sequence = fbbio.revcomp(sequence);
	findORFs(sequence, ORFs);
	findORFs(sequence[1 .. $], ORFs);
	findORFs(sequence[2 .. $], ORFs);

	foreach(ORF; ORFs.keys)
	{
		writeln(ORF);
	}
}

void findORFs(ref string sequence, ref byte[string] ORFs)
{
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
	
	// A slow way of building the translated sequence
	// Inefficient but easy to implement
	char[] translatedSequence;
	for(uint i; i < sequence.length-3; i+=3)
	{
		 translatedSequence ~= [DNAcodons[sequence[i .. i+3]]];	
	}

	bool inORF = false;
	uint[] ORFstart;

	foreach(uint i, aa; translatedSequence)
	{
		switch (aa)
		{
			case 'M':
				ORFstart ~= [i];
				inORF = true;
				break;
			case '*':
				if (inORF)
				{
					foreach(pos; ORFstart)
					{
						ORFs[cast(string) translatedSequence[pos .. i]] = 0;
					}
					ORFstart = [];
					inORF = false;
				}
				break;
			default:
				break;
		}
	}
}

