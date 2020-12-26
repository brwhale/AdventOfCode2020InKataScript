joltList = [];

while("" != (s = getline())) {
    joltList += int(s);
}
sort(joltList);
joltList += (3 + joltList[length(joltList) - 1]);
joltcounts = list(0,0,0,0);
lastJolt = 0;
foreach(jolt; joltList) {
    var diff = jolt - lastJolt;
    joltcounts[diff]++;
    lastJolt = jolt;
}

print("Joint diffs: ");
print(joltcounts);
print("answer = " + (joltcounts[1] * joltcounts[3]));

// part 2

func findVariants(i, jolts, answerBag) {
    var len = length(jolts);
    if(i == len - 1) {
    	return 1;
    }
    if(answerBag[i] != null) {
	    return answerBag[i];
    }
    var total = 0;
    for(j = i + 1; j < len; j++) {
        if(jolts[j] - jolts[i] <= 3) {
            total += findVariants(j, jolts, answerBag);
        }
    }
    answerBag[i] = total;
    return total;
}

answers = dictionary();
vars = findVariants(0, list(0) + joltList, answers);

print(vars);

print("found " + vars + " variants:");