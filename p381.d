import std.stdio;
import std.container;
import std.typecons;
import std.array;
import std.algorithm;
import std.conv;

void main() {
    string path = "/home/vlas/probem381/data";
    auto data = parse_input(path);
    writeln(" ", data.length);
    write(" ");
    foreach (point; data) {
        write(point[0], " ");
        write(point[1], " ");
    }
    writeln();
}

Array!(Tuple!(int, int)) parse_input(string path) {
    File file = File(path, "r");
    int ncase;
    file.readf!"%d\n"(ncase);
    auto data = Array!(Tuple!(int, int))();
    auto parts = file.readln.split.map!(to!int).array;

    for (int i = 0; i < parts.length; i += 2) {
        Tuple!(int, int) point;
        point[0] = parts[i];
        if (i + 1 < parts.length) {
            point[1] = parts[i + 1];
        } else {
            point[1] = 0; 
        }
        data ~= point;
    }

    return data;
}
