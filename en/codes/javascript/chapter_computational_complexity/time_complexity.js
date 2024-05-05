/**
 * File: time_complexity.js
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Constant complexity */
function constant(n) {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* Linear complexity */
function linear(n) {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* Linear complexity (traversing an array) */
function arrayTraversal(nums) {
    let count = 0;
    // Loop count is proportional to the length of the array
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* Quadratic complexity */
function quadratic(n) {
    let count = 0;
    // Loop count is squared in relation to the data size n
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Quadratic complexity (bubble sort) */
function bubbleSort(nums) {
    let count = 0; // Counter
    // Outer loop: unsorted range is [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Element swap includes 3 individual operations
            }
        }
    }
    return count;
}

/* Exponential complexity (loop implementation) */
function exponential(n) {
    let count = 0,
        base = 1;
    // Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Exponential complexity (recursive implementation) */
function expRecur(n) {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Logarithmic complexity (loop implementation) */
function logarithmic(n) {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Logarithmic complexity (recursive implementation) */
function logRecur(n) {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* Linear logarithmic complexity */
function linearLogRecur(n) {
    if (n <= 1) return 1;
    let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Factorial complexity (recursive implementation) */
function factorialRecur(n) {
    if (n === 0) return 1;
    let count = 0;
    // From 1 split into n
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
// Can modify n to experience the trend of operation count changes under various complexities
const n = 8;
console.log('Input data size n =' + n);

let count = constant(n);
console.log('Number of constant complexity operations =' + count);

count = linear(n);
console.log('Number of linear complexity operations =' + count);
count = arrayTraversal(new Array(n));
console.log('Number of linear complexity operations (traversing the array) =' + count);

count = quadratic(n);
console.log('Number of quadratic order operations =' + count);
let nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('Number of quadratic order operations (bubble sort) =' + count);

count = exponential(n);
console.log('Number of exponential complexity operations (implemented by loop) =' + count);
count = expRecur(n);
console.log('Number of exponential complexity operations (implemented by recursion) =' + count);

count = logarithmic(n);
console.log('Number of logarithmic complexity operations (implemented by loop) =' + count);
count = logRecur(n);
console.log('Number of logarithmic complexity operations (implemented by recursion) =' + count);

count = linearLogRecur(n);
console.log('Number of linear logarithmic complexity operations (implemented by recursion) =' + count);

count = factorialRecur(n);
console.log('Number of factorial complexity operations (implemented by recursion) =' + count);
