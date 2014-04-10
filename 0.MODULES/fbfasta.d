module fbfasta;
// Written in the D programming language
// Simple FASTA parser that makes strict assumptions on 
// the format of the input.
// Fredrik Boulund 2012
import std.stdio;
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
    uint recordcounter = 0;
    string currentLine;
    FastaStruct[] records; // Will store all fasta records

    /* Open fastaFile for reading */
    File fastaFile = File(filename, "r");
    /* Read one line at a time */
    currentLine = fastaFile.readln();
	if (currentLine[0] != '>') {
		writefln("ERROR, file %s not FASTA?", filename);
	}
    while (!fastaFile.eof()) {
        if (currentLine[0] == '>') {
            records ~= FastaStruct("",""); // Append new record to array
            recordcounter = cast(uint) records.length;
            records[recordcounter-1].header = cast(string) chomp(currentLine);
        }
        else {
            records[recordcounter-1].sequence = 
				records[recordcounter-1].sequence
				~ cast(string) chomp(currentLine);
        }
        currentLine = fastaFile.readln();
    }
    return records;
}
