import std.stdio;
import std.conv;

int main(string[] args) {
//    writeBigLabel!("Program started");

    // Program here

//    writeBigLabel!("Program terminated");

    return 0;
}

void writeBigLabel(string msg)() {
    writeln(line!('_', 80));
    writeln("");
    writeln(" ", msg);
    writeln(line!('_', 80));
    writeln("");

}

unittest { writeBigLabel!("Unittests activated"); }

string line(char c, uint length)() {
    char [] arr = new char[length];
    foreach (i; 0 .. length) arr[i] = c;
    return arr;
}

unittest {
    assert("__________" == line!('_', 10));
}


struct JSON {
    string data_;
    @disable
    this();
    this(string data) { this.data_ = data; }
    this(JSON json) {
        this.data_ = json.data_;
    }
}

//struct XML {
//    string data_;
//    this(string data) { this.data_ = data; }
//}

import std.range;
import std.traits;
import std.string;

class GenericList(T) {
    int size = 0;
    auto arr = new void*[0];

    void put(in ref T elem) {
        writefln("list item at 0x%X", cast(size_t)&elem);
        arr.length++;
        arr[size++] = cast(void*)&elem;
    }
    
    ref T get(in int i) {
        if(i >= size)
            throw new Exception("Index out of bounds, index: " ~ to!string(i) ~
                                ", size: " ~ to!string(size));
        writeln("list item at ", cast(size_t)arr[i]);
            
        return *cast(T*)arr[i];
    }
}

unittest {
GenericList!JSON list = new GenericList!JSON;

JSON json = JSON("{\"type\": \"request\"}");

writefln("json at 0x%X", cast(size_t)&json);

list.put(json);
writeln(&json, " <-> ", &list.get(0));
assert(json == list.get(0));

//writeln("gen list done.");
}

unittest {
JSON json = JSON("");
assert(16 == JSON.sizeof);
assert(8 == (&json).sizeof);

int x = 3;
assert(4 == int.sizeof);
assert(8 == (&x).sizeof);
}

