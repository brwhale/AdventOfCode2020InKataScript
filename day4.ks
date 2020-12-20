requiredfields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"];

func getPassport() {
    print("Enter passport");
    r = "";
    s = getline();
    while(s != "") {
        r += s + " ";
        s = getline();
    }
    return r;
}

func getName(s) {
    return split(s, ":")[0];
}

func checkPassport(pass) {
    toks = split(pass, " ");
    names = map(toks, getName);
    foreach (field; requiredfields) {
        if (!contains(names, field)) {
            return false;
        }
    }
    return true;
}

p = getPassport();
passports = [];
while (p != "") {
    passports += p;
    p = getPassport();
}
print("Gathered " + length(passports) + " passports");

print("mapping");
mapped = map(passports, checkPassport);
print(mapped);

print("folding");
validcount = fold(mapped, +, 0);
print(validcount);

func checkPassportPart2(pass) {
    toks = split(pass, " ");
    names = map(toks, getName);
    foreach (field; requiredfields) {
        if (!contains(names, field)) {
            return false;
        }
    }
    foreach(token; toks) {
        tok = split(token, ":");
        if (tok[0] == "byr") {
            year = int(tok[1]);
            if (year < 1920 || year > 2002) {
                return false;
            }
        } else if (tok[0] == "iyr") {
            year = int(tok[1]);
            if (year < 2010 || year > 2020) {
                return false;
            }
        } else if (tok[0] == "eyr") {
            year = int(tok[1]);
            if (year < 2020 || year > 2030) {
                return false;
            }
        } else if (tok[0] == "hgt") {
            height = int(tok[1]);
            unitsmaybe = split(tok[1], height);
            if (length(unitsmaybe) < 2) {
                return false;
            }
            units = unitsmaybe[1];
            if (units == "cm") {
                if (height < 150 || height > 193) {
                    return false;
                }
            } else if (units == "in") {
                if (height < 59 || height > 76) {
                    return false;
                }
            } else {
                return false;
            }            
        } else if (tok[0] == "hcl") {
            if (length(tok[1]) != 7) {
                return false;
            }
            chars = array(tok[1]);
            if (chars[0] != "#") {
                return false;
            }
            acceptChars = array("0123456789abcdef");
            for(i = 1; i < 7; ++i) {
                if (!contains(acceptChars, chars[i])) {
                    return false;
                }
            }     
        } else if (tok[0] == "ecl") {
            acceptWords = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"];
            if (!contains(acceptWords, tok[1])) {
                return false;
            }    
        } else if (tok[0] == "pid") {
            if (length(tok[1]) != 9) {
                return false;
            }
            chars = array(tok[1]);
            acceptChars = array("0123456789");
            foreach(char; chars) {
                if (!contains(acceptChars, char)) {
                    return false;
                } 
            } 
        }
    }
    return true;
}

print("mapping pt 2");
mapped2 = map(passports, checkPassportPart2);
print(mapped2);

print("folding pt 2");
validcount2 = fold(mapped2, +, 0);
print(validcount2);