module Satellite;

import std.stdio;

bool[1023] chipSeq(){
	bool[1023] seq;
	return seq;
}

    public bool[] generateChipSequenceAfter(int t, int xor1Index, int xor2Index) {
        return null;
//        generateChipsequence();
    }

    private bool[] generateChipsequence(in int xor1Index, in int xor2Index,
    									bool[10] upperSeq = [1,1,1,1,1,1,1,1,1,1],
    									bool[10] lowerSeq = [1,1,1,1,1,1,1,1,1,1]) {
  
        bool[] chipSeq = new bool[1023];
        for (int i = 0; i < 1023; i++) {
            // upper mother seq
            bool upperOut = upperSeq[$ - 1];
            shiftRight(upperSeq);
            // seqUpper 3 b/c we shifted before
            upperSeq[0] = upperOut ^ upperSeq[3];
            
            // lower mother seq
            bool lowerOut = lowerSeq[xor1Index] ^ lowerSeq[xor2Index];
            bool lowerVal = lowerSeq[9];
            shiftRight(lowerSeq);
            lowerSeq[0] = lowerVal ^ lowerSeq[1] ^ lowerSeq[2]
                        ^ lowerSeq[5] ^ lowerSeq[7] ^ lowerSeq[8];

            chipSeq[i] = upperOut ^ lowerOut;
        }
        return chipSeq;
    }

void shiftRight(ref bool[10] sequence)
out{
	assert(sequence[0] == sequence[1]);
}
body
{
	// shift each bit
	foreach_reverse(int i; 0..9){
		sequence[i + 1] = sequence[i];
	}
}
unittest {
	import std.stdio;
	
	bool[10] before = [1,0,1,0,1,0,1,0,1,0];
	bool[10] after = [1,1,0,1,0,1,0,1,0,1];
	shiftRight(before);
    assert(before == after);
    assert(before == after);
}
unittest{
import std.stdio;

writeln(generateChipsequence(2,6));
}
