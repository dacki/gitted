module lambdaparser;

import std.stdio;

import std.string;
import pegged.grammar;

mixin(grammar(
`lambda:
    Term        <- Abstraction / Application / Variable / Paren
    Paren	<- "(" :_ Term :_ ")"
    Application	<- (Abstraction / Variable / Paren) :_ Term
    Abstraction	<- ("\\" Variable :_ ("->" / ".") :_ Term)
    Variable    <- [a-z]+
    _           <- [ \t\r\n]*
`));

/+
mixin(grammar(
'lambda:
    Term		<- Application / Abstraction / Variable / ("(" Term ")")
    Application	<- (Abstraction / Variable) :_ Term
    Abstraction	<- ("\\" Variable :_ ("->" / ".") :_ Term)
    Variable	<- [a-z]+
    _			<- [ \t\r\n]*
'));
+/

unittest {
  enum tree = lambda("x");
//  printRecursive(tree, 0);

}

unittest {
  enum tree = lambda("x x");
//  printRecursive(tree, 0);

}

unittest {
  enum tree = lambda(r"\x.x");
//  printRecursive(tree, 0);

}

unittest {
  enum tree = lambda(r"\x -> x");
//  printRecursive(tree, 0);

}

unittest {
  enum tree = lambda(r"(\x.\y.\z.(x y) z)((\x.x)(\x.x))");
  //  writeln(tree);
//  printRecursive(tree, 0);

}

void printRecursive(ParseTree tree, uint offset) {
  writeln(spaces(offset), tree.name, ": ", tree.input[tree.begin .. tree.end], " (",
          successful(tree.successful), ")");
  foreach (child; tree.children) {
  	printRecursive(child, offset + 1);
  }
}

string successful(bool success) { return success ? "successful" : "UNSUCCESSFUL"; }

string spaces(uint n) {
  string s = "";
  foreach(i; 0 .. n) s~="  ";
  return s;
}

/*
================================================================================
 ParseTree to Lambda tree converter
================================================================================
*/

import app;

Term convert(ParseTree source) {
  if (!source.successful)
    throw new Exception("Error parsing AST element.");

    switch(source.name) {
    case "lambda.Paren":
      return convert(source.children[0]);
    case "lambda.Variable":
      return new Variable(source.ss);
    case "lambda.Application":
      return new Application(convert(source.children[0]),
                             convert(source.children[1]));
    case "lambda.Abstraction":
      return new Abstraction(new Variable(source.children[0].ss),
                             convert(source.children[1]));
    case "lambda.Term":
      return convert(source.children[0]);
    case "lambda":
      return convert(source.children[0]);
    default:
      if(!source.successful) throw new Exception("Parse error in " ~ source.name);
    }
  return null;
}

string ss(ParseTree tree) {
  return tree.input[tree.begin .. tree.end];
}


unittest {
  enum tree = lambda(r"\x -> x");
  auto term = convert(tree);
  assertEquals(r"(\x -> x)", term.toString);
}
