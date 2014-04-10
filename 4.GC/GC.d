#!/usr/bin/env rdmd
// Written in the D programming language
// Rosalind problem #4: GC
// Fredrik Boulund 2012
import std.stdio;
import std.getopt; // Parse command line arguments
import std.string; // chomp

/* FastaStruct with two string fields */
struct FastaStruct
{
    string header = "";
    string sequence = "";
}

/*
  Implementation using io.stream to read FASTA file line by line.
*/
FastaStruct[] parseFasta(string filename) {
    int recordcounter = 0;
    string currentLine;
    FastaStruct[] recordsFromFile; // Will store all fasta records

    /* Open fastaFile for reading */
    File fastaFile = File(filename, "r");
    /* Read one line at a time */
    currentLine = fastaFile.readln();
	if (currentLine[0] != '>') {
		writefln("ERROR, file %s not FASTA?", filename);
	}
    while (!fastaFile.eof()) {
        if (currentLine[0] == '>') {
            recordsFromFile ~= FastaStruct("",""); // Append new record to array
            recordcounter = cast(int)recordsFromFile.length;
            recordsFromFile[recordcounter-1].header = cast(string) chomp(currentLine);
        }
        else {
            recordsFromFile[recordcounter-1].sequence = 
				recordsFromFile[recordcounter-1].sequence
				~ cast(string) chomp(currentLine);
        }
        currentLine = fastaFile.readln();
    }
    return recordsFromFile;
}

/*
  Computes GC content of a string.
  Assumes everything is in upper case.
*/
float computeGC(string sequence) {
	float gc = 0;
	foreach(nucleotide; sequence) {
		if( (nucleotide == 'G') | (nucleotide == 'C'))
			gc++;
	}
	return (gc/sequence.length);
}

void printHelp() {
    writeln("Compute GC content and return the FASTA header with the highest\n");
	writeln("GC content. Written in D, Fredrik Boulund (c) 2012");
    writeln("  usage: GC.d [options] file.fasta");
    writeln("Available options:\n"
      "  -h, --help              show this friendly and helpful message\n"
    	);
}

int main(string[] args) {
	bool help;
	// Parse command line arguments
	if(args.length < 2) {
		printHelp();
		return 0;
	}

	//Read FASTA file
	FastaStruct[] FastaRecords = parseFasta(args[1]);

	// Find sequence with highest GC content
	float gc = -1;
	float highestGC = 0;
	FastaStruct highestGCrecord;
	foreach(record; FastaRecords) {
		gc = computeGC(record.sequence);	
		if(gc > highestGC) {
			highestGCrecord = record;
			highestGC = gc;
		}
	}
	writefln("%s\n%2.6f%%", highestGCrecord.header[1..highestGCrecord.header.length], highestGC*100);

	return 0;
}
