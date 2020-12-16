inlines = [getline()];

while("" != (s = getline())) {
    inlines += s;
}

func traverse(lines, right, down) {
    x = 0;
    y = 0;
    linecount = length(lines);
    treecount = 0;
    while(y < linecount){
        line = split(lines[y]);
        len = length(line);
        if (len) {
            if (line[x % len] == "#") {
                treecount++;
            }
        }
        x += right;
        y += down;
    }
    return treecount;
}

// part 1
print("part 1:");
print(traverse(inlines,3,1));

// part 2
runs = [
    traverse(inlines,1,1),
    traverse(inlines,3,1),
    traverse(inlines,5,1),
    traverse(inlines,7,1),
    traverse(inlines,1,2)
];

print("part 2:");
total = 1;
foreach(run; runs) {
    print(run);
    total *= run;
}
print(total);