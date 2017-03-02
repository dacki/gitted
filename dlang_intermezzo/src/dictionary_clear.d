@("Tell the console that tests are running")
unittest
{
    import std.stdio;
    writeln("Running unit tests");
}

/// Fails with LDC 1.0.0
@("Test that a clear method on a Dictionary of arrays exist")
unittest
{
    int[int] aa;
    aa.clear;
}

@("AA remove")
unittest
{
    int[int] aa;
    aa.remove(1);
}

@("Element in AA")
unittest
{
    int[int] aa;
    int* result = 1 in aa;
}

@("AA access")
unittest
{
    int[int] aa;
    aa[0] = 1;
    int value = aa[0];
}

@("AA length")
unittest
{
    int[int] aa;
    cast(void)aa.length;
}

@("AA keys")
unittest
{
    int[int] aa;
    aa.keys;
}

@("AA values")
unittest
{
    int[int] aa;
    aa.values;
}

@("AA rehash")
unittest
{
    int[int] aa;
    aa.rehash;
}

@("AA byKey()")
unittest
{
    int[int] aa;
    aa.byKey;
}
