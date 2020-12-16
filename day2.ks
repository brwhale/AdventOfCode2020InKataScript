func countInstances(str, chr) {
    l = split(str);
    count = 0;
    foreach(c; l) {
        if (c == chr) {
            count++;
        }
    }
    return count;
}

func isValid(pass) {
    tokens = split(pass, " ");
    minmax = split(tokens[0], "-");
    min = int(minmax[0]);
    max = int(minmax[1]);
    testchar = split(tokens[1], ":")[0];
    count = countInstances(tokens[2], testchar);
    return count >= min && count <= max;
}

inlines = [getline()];

while("" != (s = getline())) {
    inlines += s;
}

validCount = 0;
foreach(s; inlines) {
    if (isValid(s)) {
        validCount++;
    }
}
print(validCount + " valid passwords");

// part 2
func isValid2(pass) {
    tokens = split(pass, " ");
    indexes = split(tokens[0], "-");
    index1 = int(indexes[0])-1;
    index2 = int(indexes[1])-1;
    chars = split(tokens[2]);
    len = length(chars);
    if (len <= index1 || len <= index2) {
        return false;
    } 
    testchar = split(tokens[1], ":")[0];
    return (chars[index1] == testchar) != (chars[index2] == testchar);
}

validCount = 0;
foreach(s; inlines) {
    if (isValid2(s)) {
        validCount++;
    }
}
print(validCount + " valid passwords pt2");