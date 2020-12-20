func pow(x, n) {
    r = x;
    while (--n > 0) {
        r *= x;
    }
    return r;
}

func getdec(s, oneRep, startIndex) {
    chars = array(s);
    len = length(chars);
    cur = 64;
    count = len - startIndex;
    if (count < 7) {
        cur = pow(2, count-1);
    }
    total = 0;
    
    for(i = startIndex; i < len; ++i) {
        //print("compare " + chars[i]+ ", " + oneRep);
        if (chars[i] == oneRep) {
            //print("total " + total + ", cur " + cur);
            total += cur;
        }
        cur /= 2;
    }
    //print("total " + total + ", cur " + cur);
    return total;
}

highest = 0;
lowest = 1000;
ids = [];
while("" != (s = getline())){
    row = getdec(s, "B", 0);
    col = getdec(s, "R", 7);
    print(row + ", " + col);
    id = (row * 8 + col);
    ids += id;
    print("id: " + id);
    if (id > highest) {
        highest = id;
    }
    if (id < lowest) {
        lowest = id;
    }
}

for(i = lowest; i < highest; ++i) {
    if (!contains(ids, i)) {
        print("missing seat: " + i);
    }
}

print("highest: " + highest);