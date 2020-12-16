// create empty array
v = array();
// read values from stdin
while("" != (s = getline())) {
    v += int(s);
}
// get length once
len = length(v);
// find the match
for (i = 0; i < len; i++) {
    for(j = i + 1; j < len; j++) { 
        // target is a + b = 2020
        if (v[i] + v[j] == 2020) {
            print("Match found!");
            print(v[i] + " + " + v[j] + " = " + (v[i] + v[j]));
            print(v[i] + " * " + v[j] + " = " + (v[i] * v[j]));
        }
    }
}

// part 2
for (i = 0; i < len; i++) {
    for(j = i + 1; j < len; j++) { 
        for (k = j + 1; k < len; k++) {
            // target is a + b + c = 2020
            if (v[i] + v[j] + v[k] == 2020) {
                print("Match found for part 2!");
                print(v[i] + " + " + v[j] + " + " + v[k]
                    + " = " + (v[i] + v[j] + v[k]));
                print(v[i] + " * " + v[j] + " * " + v[k] 
                    + " = " + (v[i] * v[j] * v[k]));
            }
        }
    }
}