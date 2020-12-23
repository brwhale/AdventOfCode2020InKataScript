func getGroup() {
    retchars = [];
    print("enter group answers");
    while("" != (s = getline())) {
        schars = list(s);
        foreach(ch; schars) {
            if (!contains(retchars, ch)) {
                retchars += ch;
            }
        }
    }
    len = length(retchars);
    print("len = " + len);
    return len;
}

total = 0;
n = getGroup();
while(0 != n) {
    total += n;
    n = getGroup();
}

print("Total: " + total);

// part 2
func getGroupPt2(start) {
    retchars = list(start);
    if (length(retchars) == 0) {
        return 0;
    }
    var s;
    while("" != (s = getline())) {
        schars = list(s);
        badchars = [];
        foreach(ch; retchars) {
            if (!contains(schars, ch)) {
                badchars += ch;
            }
        }
        print("badchars " + string(badchars));
        foreach(ch; badchars) {
            erase(retchars, find(retchars, ch));
        }
        print("retchars " + string(retchars));
    }
    len = length(retchars);
    print("len = " + len + " finalchars: " + string(retchars));
    return len;
}

total = 0;
print("enter group answers for pt 2");
s = getline();
while("" != s) { 
    n = getGroupPt2(s);
    total += n;
    print("enter group answers for pt 2");
    s = getline();
}

print("Total: " + total);