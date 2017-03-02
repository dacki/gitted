module MessageParser;

import std.conv;
import std.string;

int[] parseMsg(string msg){
	auto values = new int[1023];
	int i = 0;
	while(msg != ""){
		munch(msg, " "); //skip space
		values[i++] = parse!int(msg);
	}
	return values;
}

unittest{
	import std.stdio;
	
	auto vals = parseMsg("1 2 3");
	vals.length = 3;
	assert([1,2,3] == vals);
}

unittest{
	import std.stdio;
	import input;
	
	assert(PARSED_VALS == parseMsg(INPUT_STR));
	writeln("MessageParser test passed.");
}
