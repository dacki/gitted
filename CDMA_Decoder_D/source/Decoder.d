module Decoder;

import std.math;
import std.stdio;

private immutable THRESHOLD = 800;

void decode(int[] msg, int[1023] chipseq, int satId = 0){
	for(int offset = 0; offset < chipseq.length; offset++){
		int correlation = correlation(msg,chipseq,offset);
		if(abs(correlation) > THRESHOLD){
			byte val = correlation > 0 ? 1 : 0;
			writefln("Satellite %s sent msg %s (offset: %s)", satId, val, offset);
		}
	}
}

int correlation(in int[] msg, in int[] chipseq, in int offset)
in {
  assert(offset <= msg.length);
}
body {
  int correlation = 0;
  for(int i = 0; i < chipseq.length; i++) {
    correlation += msg[(i + offset) % msg.length] * (chipseq[i] == 0 ? -1 : chipseq[i]); 
  }
  return correlation;
}
	
unittest {
  import std.stdio;
  import input;

  writeln("Decoder test missing.");
}
