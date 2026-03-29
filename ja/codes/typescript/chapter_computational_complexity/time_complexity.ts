/**
 * File: time_complexity.ts
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 定数階 */
function constant(n: number): number {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* 線形階 */
function linear(n: number): number {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* 線形時間（配列を走査） */
function arrayTraversal(nums: number[]): number {
    let count = 0;
    // ループ回数は配列長に比例する
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* 二乗階 */
function quadratic(n: number): number {
    let count = 0;
    // ループ回数はデータサイズ n の二乗に比例する
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 二次時間（バブルソート） */
function bubbleSort(nums: number[]): number {
    let count = 0; // カウンタ
    // 外側のループ：未ソート区間は [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 要素交換には 3 回の単位操作が含まれる
            }
        }
    }
    return count;
}

/* 指数時間（ループ実装） */
function exponential(n: number): number {
    let count = 0,
        base = 1;
    // 細胞は各ラウンドで 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 指数時間（再帰実装） */
function expRecur(n: number): number {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 対数時間（ループ実装） */
function logarithmic(n: number): number {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 対数時間（再帰実装） */
function logRecur(n: number): number {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* 線形対数時間 */
function linearLogRecur(n: number): number {
    if (n <= 1) return 1;
    let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 階乗時間（再帰実装） */
function factorialRecur(n: number): number {
    if (n === 0) return 1;
    let count = 0;
    // 1個から n 個に分裂
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
// n を変えて実行し、各計算量で操作回数がどう変化するかを確認できる
const n = 8;
console.log('入力データサイズ n = ' + n);

let count = constant(n);
console.log('定数時間の操作回数 = ' + count);

count = linear(n);
console.log('線形時間の操作回数 = ' + count);
count = arrayTraversal(new Array(n));
console.log('線形時間（配列の走査）の操作回数 = ' + count);

count = quadratic(n);
console.log('二乗時間の操作回数 = ' + count);
var nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('二乗時間（バブルソート）の操作回数 = ' + count);

count = exponential(n);
console.log('指数時間（ループ実装）の操作回数 = ' + count);
count = expRecur(n);
console.log('指数時間（再帰実装）の操作回数 = ' + count);

count = logarithmic(n);
console.log('対数時間（ループ実装）の操作回数 = ' + count);
count = logRecur(n);
console.log('対数時間（再帰実装）の操作回数 = ' + count);

count = linearLogRecur(n);
console.log('線形対数時間（再帰実装）の操作回数 = ' + count);

count = factorialRecur(n);
console.log('階乗時間（再帰実装）の操作回数 = ' + count);

export {};
