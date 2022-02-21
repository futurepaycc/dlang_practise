/+ dub.sdl:
    name "yaml1"
    dependency "dyaml" version="0.8.3"
+/
import std.stdio;
import dyaml;

void main(string[] args) {
    Node root = Loader.fromString("
Hello World : [Hello, World]
Answer : 42
").load();
    foreach (string word; root["Hello World"]) {
        writeln(word);
    }
    writeln("The answer is ", root["Answer"].as!int);

    //Dump the loaded document to output.yaml.
    // dumper().dump(File("output.yaml", "w").lockingTextWriter, root);
}
