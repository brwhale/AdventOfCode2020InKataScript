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

func getInvalid(nums) {
    var size = length(nums);
    for(i = 0; i < size; i++) {
        var valid = isValid(nums, i, 25);
        if (!valid) {
            return nums[i];
        }
    }
}

invalidNum = getInvalid(numbers);
print(invalidNum + " is invalid");

func findCode(nums, inval) {
    var size = length(nums);
    for(i = 0; i < size; i++) {
        var sum = 0;
        var j = i;
        while (sum < inval) {
            sum += nums[j];
            j++;
        }
        if (sum == inval) {
            print("found run");
            print(nums[i] + " to " + nums[j-1]);
            var small = nums[j-1];
            var big = small;
            for(a = j-2; a >= i; --a) {
                small = min(nums[a], small);
                big = max(nums[a], big);
            }
            return big + small;
        }
    }
}

print("Secret code = " + findCode(numbers, invalidNum));