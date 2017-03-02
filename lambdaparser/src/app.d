module app;

import std.stdio;
import std.regex;
import std.typecons;

import lambdaparser;

void main(string[] args) {
  // All tests are in the unittest blocks (see below)
  // Run with 'dub run -b unittest'
  // 'DUB' (build tool) and d-compiler(e.g. 'dmd') needed.
}

/// Abstract syntax tree
class Ast {
public:
  Term t_;
  this(Term t) {
    t_ = t;
  }

  // Single reduce step
  void reduce() {
    t_ = t_.reduce();
  }

  // Reduce completely
  void reduceAll() {
    string old = "";
    while (t_.toString != old) {
      old = t_.toString;
      reduce;
    }
  }
  
  override string toString() { return t_.toString; }
}

enum Type {Variable, Abstraction, Application}

// Base class for all AST classes
interface Term {
public:
  // Perform a reduce step
  Term reduce();
  // Replace matching variable with Term t
  Term replace(Variable v, Term t);
  // Rename variable to prevent name clash
  Term rename();
  // String representation
  string toString();
  // Show type (Abstraction, Application, Variable)
  Type type();
  // Find next free variable
  Term freeVariable();
  // Create a copy
  Term dup();
}

/*
================================================================================
 Abstraction
================================================================================
*/

class Abstraction : Term {
public:
  Variable v_;
  Term t_;
 
  this(Variable v, Term t) {
    this.v_ = v;
    this.t_ = t;
  }

  this(string vName, Term t) {
    this.v_ = new Variable(vName);
    this.t_ = t;
  }
  
  override Term reduce() {
    //    auto freeVariable = t_.freeVariable;
    //    if (freeVariable is null)
    //return this;
    //else {
    //  t_ = t_.rename();
    //  return t_.replace(v_, freeVariable);
    //    }
    t_ = t_.reduce();
    return this;
  }

  override Term replace(Variable v, Term t) {
    t_ = t_.replace(v, t);
    return this;
  }

  override Term rename() {
    import std.conv;
    auto oldVariavle = v_;
    v_ = new Variable(v_.name_ ~ fresh().to!string);
    t_ = t_.rename;
    t_ = t_.replace(oldVariavle, v_);
    return this;
  }
  
  override string toString() {
    return "(\\" ~ v_.toString ~ " -> " ~ t_.toString ~ ")";
  }

  override Type type() { return Type.Abstraction; }

  public Term freeVariable() {
    switch (t_.type) {
    case Type.Abstraction:
      return t_.freeVariable;
    case Type.Application:
      auto application = cast(Application)t_;
      t_ = application.lterm_;
      return application.rterm_;
    default:
      return null; // Var is not free in this context
    }
  }

  override Term dup() {
    return new Abstraction(cast(Variable)v_.dup, t_.dup);
  }

}

/*
================================================================================
 Application
================================================================================
*/

class Application : Term {
public:
  Term lterm_;
  Term rterm_;
	
  this(Term lterm, Term rterm) {
    assert(lterm !is null);
    assert(rterm !is null);
  
    this.lterm_ = lterm;
    this.rterm_ = rterm;
  }
	
  override Term reduce() {
    switch (lterm_.type()) {
      case Type.Abstraction:
	lterm_ = lterm_.rename;
	auto abstr = cast(Abstraction)lterm_;
	abstr = cast(Abstraction) lterm_.replace(abstr.v_, rterm_);
	return abstr.t_;
      case Type.Application:
	lterm_ = lterm_.reduce();
        rterm_ = rterm_.reduce();
	if (lterm_.type == Type.Abstraction) {
	  auto abstr = cast(Abstraction)lterm_;
	  abstr = cast(Abstraction) lterm_.replace(abstr.v_, rterm_);
	  return abstr.t_;
	} else {
          return this;
	}
      default:
        lterm_ = lterm_.reduce();
        rterm_ = rterm_.reduce();
        return this;
    }
  }
  
  override Term replace(Variable v, Term t) {
    lterm_ = lterm_.replace(v, t.dup);
    rterm_ = rterm_.replace(v, t.dup);
    return this;
  }

  override Term rename() {
    lterm_ = lterm_.rename;
    rterm_ = rterm_.rename;
    return this;
  }
  
  override string toString() {
    return "(" ~ lterm_.toString ~ " " ~ rterm_.toString ~ ")";
  }
  
  override Type type() { return Type.Application; }
  
  override public Term freeVariable() {
    return rterm_;
  }

  override Term dup() {
    return new Application (lterm_.dup, rterm_.dup);
  }
}

/*
================================================================================
 Variable
================================================================================
*/

class Variable : Term {
public:
  string name_;
  this(string name) { this.name_ = name; }
  
  override Term reduce() { return this; }
  
   override string toString() {
     import std.regex;
     import std.conv;
     auto removeRenaming = ctRegex!("[A-Za-z]+");
     return name_.matchFirst(removeRenaming)[0];
     //     return name_;
  }
  
  override Term replace(Variable v, Term t) {
    if (name_ == v.name_) {
      return t.dup;
    } else {
      return this;
    }
  }

  override Term rename() { return this; }
  override Type type() { return Type.Variable; }
  override public Term freeVariable() { return null; }
  override Term dup() {
    return new Variable(name_);
  }
}

// Create fresh number for variable substitution
int fresh() {
  static int x = 0;
  return x++;
}

// Shortcuts
Term abs(string v, Term t) { return new Abstraction(v, t); }
Term app(Term lhs, Term rhs) { return new Application(lhs, rhs); }
Term var(string name) { return new Variable(name); }
Ast lambda(Term t) { return new Ast(t); }
Ast parseLambda(string lambda) {
  lambdaparser.ParseTree tree = lambdaparser.lambda(lambda);
  return new Ast(convert(tree));
}

/*
================================================================================
Unittest utils
================================================================================
*/

void assertEquals(T1,T2)(T1 lhs, T2 rhs, string file = __FILE__, uint line = __LINE__) {
  if (lhs != rhs)
    writeln(file, ":", line, ": Equals failed.\n  Expected: ",lhs, "\n  Actual:   ", rhs);
}

/*
================================================================================
 Test cases
================================================================================
*/

// (\x.x) (\x.x)
unittest {
  auto term = parseLambda(r"(\x.x) (\x.x)");
  term.reduce;
  assertEquals(r"(\x -> x)",term.toString);
}

// (\x.\y.\z.(x y) z) ((\x.x) (\x.x))
unittest {
  auto term = parseLambda(r"(\x.\y.\z.(x y) z) ((\x.x) (\x.x))");
  term.reduce;
  assertEquals(r"(\y -> (\z -> ((((\x -> x) (\x -> x)) y) z)))", term.toString);
  assertEquals(Type.Abstraction, term.t_.type);
  term.reduce;
  assertEquals(r"(\x -> x)",term.toString);
}

unittest {
  auto term = parseLambda(r"(\x.(x x))(\y.y)");
  term.reduceAll;
  assertEquals(r"(\y -> y)", term.toString);
}

// Recursion (\x.(x x))(\x.(x x))
unittest {
  auto term = parseLambda(r"(\x.(x x))(\x.(x x))");
  term.reduceAll;
  assertEquals(r"((\x -> (x x)) (\x -> (x x)))", term.toString);
}

// ((\x.x y)(\x.x))(\x.x)
unittest {
  auto term = parseLambda(r"((\x.x y)(\x.x))(\x.x)");
  term.reduce;
  assertEquals(r"(((\x -> x) y) (\x -> x))", term.toString);
  term.reduce;
  assertEquals(r"(y (\x -> x))", term.toString);
}

// (\x.x y)((\x.x)(\x.x))
unittest {
  auto term = parseLambda(r"(\x.x y)((\x.x)(\x.x))");
  term.reduce;
  assertEquals(r"(((\x -> x) (\x -> x)) y)", term.toString);
  term.reduce;
  assertEquals(r"y", term.toString);
}

// Name clash: (\x.(\x.(\x.x) x) x)(y)
unittest {
  auto term = parseLambda(r"(\x.(\x.(\x.x) x) x)(y)");
  term.reduce;
  assertEquals(r"((\x -> ((\x -> x) x)) y)", term.toString);
}
