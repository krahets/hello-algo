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

/* Linear complexity (array traversal) */
function arrayTraversal(nums) {
    let count = 0;
    // The number of iterations is proportional to the array length
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* Quadratic complexity */
function quadratic(n) {
    let count = 0;
    // The number of iterations is proportional to the square of the input size n
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
    // Outer loop: the unsorted range is [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Swapping two elements takes 3 elementary operations
            }
        }
    }
    return count;
}

/* Exponential complexity (iterative implementation) */
function exponential(n) {
    let count = 0,
        base = 1;
    // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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

/* Logarithmic complexity (iterative implementation) */
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

/* Linearithmic complexity */
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
    // Split one problem into n subproblems
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver code */
// Try different values of n to see how the operation count grows for each complexity
const n = 8;
console.log('Input size n = ' + n);

let count = constant(n);
console.log('Operation count for constant complexity = ' + count);

count = linear(n);
console.log('Operation count for linear complexity = ' + count);
count = arrayTraversal(new Array(n));
console.log('Operation count for linear complexity (array traversal) = ' + count);

count = quadratic(n);
console.log('Operation count for quadratic complexity = ' + count);
let nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('Operation count for quadratic complexity (bubble sort) = ' + count);

count = exponential(n);
console.log('Operation count for exponential complexity (iterative implementation) = ' + count);
count = expRecur(n);
console.log('Operation count for exponential complexity (recursive implementation) = ' + count);

count = logarithmic(n);
console.log('Operation count for logarithmic complexity (iterative implementation) = ' + count);
count = logRecur(n);
console.log('Operation count for logarithmic complexity (recursive implementation) = ' + count);

count = linearLogRecur(n);
console.log('Operation count for linearithmic complexity (recursive implementation) = ' + count);

count = factorialRecur(n);
console.log('Operation count for factorial complexity (recursive implementation) = ' + count);
