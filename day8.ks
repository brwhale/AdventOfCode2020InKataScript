func parseCodeLine(str) {
    var tokens = split(str, " ");
    var intparts = split(tokens[1], "+");
    var intval = int(intparts[length(intparts)-1]);
    return list(tokens[0], intval, 0);
}

func runCode(code) {
    var acc = 0;
    var linecount = length(code);
    var line = 0;
    while(line < linecount && code[line][2] == 0) {
        print("evaling: " + string(code[line]));
        var op = code[line][0];
        var val = code[line][1];
        code[line][2] = 1;
        if (op == "jmp") {
            line += val;
        } else {
            if (op == "acc") {
                acc += val;
            }
            ++line;
        }
    }
    print("lines: "+line);
    print("last: " + string(code[line]));
    for(line = 0; line < linecount; line++) {
        code[line][2] = 0;
    }    
    return acc;
}

print("input code:");
codelines = [];
while("" != (s = getline())) {
    pushback(codelines, parseCodeLine(s));
}
print("running code:");
print(codelines);
print("final value: " + runCode(codelines));

// part 2

func runCode2(code) {
    var acc = 0;
    var lastJmpOrNops = [];
    var cannonLastJmpOrNops = [];
    var linecount = length(code);
    var line = 0;
    print("line " + line);
    while(line < linecount) {
        if (code[line][2] == 0) {
            print("evaling: " + string(code[line]));
            var op = code[line][0];
            var val = code[line][1];
            code[line][2] = 1;
            if (op == "jmp") {
                lastJmpOrNops += line;
                line += val;
            } else {
                if (op == "acc") {
                    acc += val;
                } else {
                    lastJmpOrNops += line;
                }
                ++line;
            }
        } else {
            if (length(cannonLastJmpOrNops) == 0) {
                cannonLastJmpOrNops = copy(lastJmpOrNops);
            }
            print("resetting");
            acc = 0;
            for(line = 0; line < linecount; line++) {
                code[line][2] = 0;
            }
            line = 0;
            var changeline = cannonLastJmpOrNops[length(cannonLastJmpOrNops) - 1];
            popback(cannonLastJmpOrNops);
            if (code[changeline][0] == "jmp") {
                code[changeline][0] = "nop";
            } else {
                code[changeline][0] = "jmp";
            }
        }
    }
    print(line);
    print("lastpt2: " + string(code[--line]));
    return acc;
}

print("running pt 2");
print("final value: " + runCode2(codelines));