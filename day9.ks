func isValid(arr, index, precount) {
    if (index < precount) {
        return true;
    }
    if (index >= length(arr)) {
        return false;
    }
    var testval = arr[index];
    for(i = index - precount; i < index; i++) {
        for (j = i; j < index; j++) {
            if (arr[i] + arr[j] == testval) {
                return true;
            }
        }
    }

    return false;
}

numbers = array();

while ("" != (s = getline())) {
    numbers += int(s);
}

size = length(numbers);
for(i = 0; i < size; i++) {
    valid = isValid(numbers, i, 25);
    print(numbers[i] + " is valid: " + valid);
    if (!valid) {
        return;
    }
}