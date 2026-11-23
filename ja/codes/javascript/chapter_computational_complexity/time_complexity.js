/**
 * File: time_complexity.js
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 定数オーダー */
function constant(n) {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* 線形オーダー */
function linear(n) {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* 線形オーダー（配列の走査） */
function arrayTraversal(nums) {
    let count = 0;
    // ループの回数は配列の長さに比例する
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* 二次オーダー */
function quadratic(n) {
    let count = 0;
    // ループの回数はデータの大きさ n の二乗に比例する
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 二次オーダー（バブルソート） */
function bubbleSort(nums) {
    let count = 0; // カウンタ
    // 外側のループ：未ソート区間は [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 要素の交換は 3 回の単位操作からなる
            }
        }
    }
    return count;
}

/* 指数オーダー（ループによる実装） */
function exponential(n) {
    let count = 0,
        base = 1;
    // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 指数オーダー（再帰による実装） */
function expRecur(n) {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 対数オーダー（ループによる実装） */
function logarithmic(n) {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 対数オーダー（再帰による実装） */
function logRecur(n) {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* 線形対数オーダー */
function linearLogRecur(n) {
    if (n <= 1) return 1;
    let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 階乗オーダー（再帰による実装） */
function factorialRecur(n) {
    if (n === 0) return 1;
    let count = 0;
    // 1 個から n 個に分裂する
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* 実行用コード */
// n を変更して実行し、各計算量で操作回数がどのように変化するか確かめられる
const n = 8;
console.log('入力データの大きさ n = ' + n);

let count = constant(n);
console.log('定数オーダーの操作回数 = ' + count);

count = linear(n);
console.log('線形オーダーの操作回数 = ' + count);
count = arrayTraversal(new Array(n));
console.log('線形オーダー（配列の走査）の操作回数 = ' + count);

count = quadratic(n);
console.log('二次オーダーの操作回数 = ' + count);
let nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('二次オーダー（バブルソート）の操作回数 = ' + count);

count = exponential(n);
console.log('指数オーダー（ループによる実装）の操作回数 = ' + count);
count = expRecur(n);
console.log('指数オーダー（再帰による実装）の操作回数 = ' + count);

count = logarithmic(n);
console.log('対数オーダー（ループによる実装）の操作回数 = ' + count);
count = logRecur(n);
console.log('対数オーダー（再帰による実装）の操作回数 = ' + count);

count = linearLogRecur(n);
console.log('線形対数オーダー（再帰による実装）の操作回数 = ' + count);

count = factorialRecur(n);
console.log('階乗オーダー（再帰による実装）の操作回数 = ' + count);
