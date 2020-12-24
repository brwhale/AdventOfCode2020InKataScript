func parseContainedBags(str) {
    var ret = [];
    var containBags = split(str, ", ");
    foreach(cbag; containBags) {
        var parts = split(cbag, " bag");
        var intpart = int(parts[0]);
        var color = string(range(parts[0], 2, length(parts[0])-1));
        pushback(ret, list(intpart, color));
    }
    return ret;
}

func parseBagDescription(str) {
    var ret = [];
    var parts = split(str, " bags contain ");
    ret["color"] = parts[0];
    ret["innerBags"] = parseContainedBags(parts[1]);
    return ret;
}

bags = dictionary();
bagCols = [];

func printAndGetLine() {
    print("enter bag info:");
    return getline();
}

while ("" != (s = printAndGetLine())) {
    var bag = parseBagDescription(s);
    print(bag);
    bagCols += bag["color"];
    bags[bag["color"]] = bag["innerBags"];
}

print(bags);

func walkBagGraph(color, targetColor) {
    var bag = bags[color];
    foreach(item; bag) {
        if (item[1] == targetColor) {
            return true;
        }
        if (walkBagGraph(item[1])) {
            return true;
        }
    }
    return false;
}

total = 0;
foreach(bag; bagCols) {
    total += walkBagGraph(bag, "shiny gold");
}

print("found " + total);

// part 2
func walkBagGraph2(color) {
    var bag = bags[color];
    var bagCount = 1;
    foreach(item; bag) {
        bagCount += item[0] * walkBagGraph2(item[1]);
    }
    return bagCount;
}
// they don't count the enclosing bag
print("size of shiny gold " + (walkBagGraph2("shiny gold")-1));