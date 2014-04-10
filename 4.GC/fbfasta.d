module fbfasta;
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
