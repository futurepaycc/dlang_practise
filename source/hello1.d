/+ dub.sdl:
    name "hello1"
+/
import std.stdio;
import core.thread;

private int sum(int a, int b)
{
    return a + b;
}

void main(string[] args)
{
    auto a = 11;
    auto b = 22;
    auto result = sum(a, b);

    writefln("result = %d",result);
    writefln("result = %d",result);
    write("test1\n");
    writefln("fuck d ...");
    // Thread.sleep(20.seconds);
    write("test1\n");
    writefln("fuck d ...");
}
