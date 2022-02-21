/+ dub.sdl:
    name "hello1"
+/
import std.stdio;
import core.thread;
import std.container: DList;

// 这里的template有点类似一个模块范围
template TScope( T ) {
    private T sum(T a, T b) {
        return a + b;
    }
}

void test1_print_sum() {
    auto a = 11;
    auto b = 22;
    auto result = TScope!int.sum(a, b);
    writefln("result = %d", result);
    writefln("result = %d", result);
    write("test1\n");
    writefln("fuck d ...");
    Thread.sleep(1.seconds);
    write("test1\n");
    writefln("fuck d ...");
}

// DList 列表
void test2_cpp_vector(){
    auto l1 = DList!int(1,2,3);
    l1.insertBack(4);
    writefln("adsf, %s",l1);
}

void main(string[] args) {
    test1_print_sum();
    test2_cpp_vector();
}