/**
 * File: time_complexity.ts
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Constant time */
function constant(n: number): number {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* Linear time */
function linear(n: number): number {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* Linear time (array traversal) */
function arrayTraversal(nums: number[]): number {
    let count = 0;
    // The iteration count is proportional to the array length
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* Quadratic time */
function quadratic(n: number): number {
    let count = 0;
    // The iteration count grows quadratically with input size n
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Quadratic time (bubble sort) */
function bubbleSort(nums: number[]): number {
    let count = 0; // Counter
    // Outer loop: the unsorted range is the closed interval [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Inner loop: swap adjacent elements to move the largest in [0, i] to index i
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

/* Exponential time (iterative) */
function exponential(n: number): number {
    let count = 0,
        base = 1;
    // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Exponential time (recursive) */
function expRecur(n: number): number {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Logarithmic time (iterative) */
function logarithmic(n: number): number {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Logarithmic time (recursive) */
function logRecur(n: number): number {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* Linearithmic time */
function linearLogRecur(n: number): number {
    if (n <= 1) return 1;
    const half = Math.floor(n / 2);
    let count = linearLogRecur(half) + linearLogRecur(half);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Factorial time (recursive) */
function factorialRecur(n: number): number {
    if (n === 0) return 1;
    let count = 0;
    // Split one problem into n subproblems
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
// Try different values of n to see how the operation count grows for each complexity
const n = 8;
console.log('Input size n = ' + n);

let count = constant(n);
console.log('Constant operation count = ' + count);

count = linear(n);
console.log('Linear operation count = ' + count);
count = arrayTraversal(new Array(n));
console.log('Linear operation count (array traversal) = ' + count);

count = quadratic(n);
console.log('Quadratic operation count = ' + count);
var nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('Quadratic operation count (bubble sort) = ' + count);

count = exponential(n);
console.log('Exponential operation count (iterative) = ' + count);
count = expRecur(n);
console.log('Exponential operation count (recursive) = ' + count);

count = logarithmic(n);
console.log('Logarithmic operation count (iterative) = ' + count);
count = logRecur(n);
console.log('Logarithmic operation count (recursive) = ' + count);

count = linearLogRecur(n);
console.log('Linearithmic operation count (recursive) = ' + count);

count = factorialRecur(n);
console.log('Factorial operation count (recursive) = ' + count);

export {};
