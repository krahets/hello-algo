/**
 * File: time_complexity.js
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Constant order */
function constant(n) {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* Linear order */
function linear(n) {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* Linear order (traversing array) */
function arrayTraversal(nums) {
    let count = 0;
    // Number of iterations is proportional to the array length
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* Exponential order */
function quadratic(n) {
    let count = 0;
    // Number of iterations is quadratically related to the data size n
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Quadratic order (bubble sort) */
function bubbleSort(nums) {
    let count = 0; // Counter
    // Outer loop: unsorted range is [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Element swap includes 3 unit operations
            }
        }
    }
    return count;
}

/* Exponential order (loop implementation) */
function exponential(n) {
    let count = 0,
        base = 1;
    // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Exponential order (recursive implementation) */
function expRecur(n) {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Logarithmic order (loop implementation) */
function logarithmic(n) {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Logarithmic order (recursive implementation) */
function logRecur(n) {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* Linearithmic order */
function linearLogRecur(n) {
    if (n <= 1) return 1;
    let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Factorial order (recursive implementation) */
function factorialRecur(n) {
    if (n === 0) return 1;
    let count = 0;
    // Split from 1 into n
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
// You can modify n to run and observe the trend of the number of operations for various complexities
const n = 8;
console.log('Input data size n = ' + n);

let count = constant(n);
console.log('Constant order operation count = ' + count);

count = linear(n);
console.log('Linear order operation count = ' + count);
count = arrayTraversal(new Array(n));
console.log('Linear order (array traversal) operation count = ' + count);

count = quadratic(n);
console.log('Quadratic order operation count = ' + count);
let nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('Quadratic order (bubble sort) operation count = ' + count);

count = exponential(n);
console.log('Exponential order (loop implementation) operation count = ' + count);
count = expRecur(n);
console.log('Exponential order (recursive implementation) operation count = ' + count);

count = logarithmic(n);
console.log('Logarithmic order (loop implementation) operation count = ' + count);
count = logRecur(n);
console.log('Logarithmic order (recursive implementation) operation count = ' + count);

count = linearLogRecur(n);
console.log('Linearithmic order (recursive implementation) operation count = ' + count);

count = factorialRecur(n);
console.log('Factorial order (recursive implementation) operation count = ' + count);
