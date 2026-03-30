/**
 * File: radix_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* 要素 num の下から k 桁目を取得（exp = 10^(k-1)） */
function digit(num: number, exp: number): number {
    // ここで高コストな累乗計算を繰り返さないよう、k ではなく exp を渡す
    return Math.floor(num / exp) % 10;
}

/* 計数ソート（nums の k 桁目でソート） */
function countingSortDigit(nums: number[], exp: number): void {
    // 10 進数の各桁は 0~9 の範囲なので、長さ 10 のバケット配列が必要
    const counter = new Array(10).fill(0);
    const n = nums.length;
    // 0~9 の各数字の出現回数を集計する
    for (let i = 0; i < n; i++) {
        const d = digit(nums[i], exp); // nums[i] の第 k 位を取得し、d とする
        counter[d]++; // 数字 d の出現回数を数える
    }
    // 累積和を求め、「出現回数」を「配列インデックス」に変換する
    for (let i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // 逆順に走査し、バケット内の集計結果に従って各要素を res に格納する
    const res = new Array(n).fill(0);
    for (let i = n - 1; i >= 0; i--) {
        const d = digit(nums[i], exp);
        const j = counter[d] - 1; // d の配列内インデックス j を取得する
        res[j] = nums[i]; // 現在の要素をインデックス j に格納する
        counter[d]--; // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書きする
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* 基数ソート */
function radixSort(nums: number[]): void {
    // 最大桁数の判定用に配列の最大要素を取得
    let m: number = Math.max(... nums);
    // 下位桁から上位桁の順に走査する
    for (let exp = 1; exp <= m; exp *= 10) {
        // 配列要素の k 桁目に対して計数ソートを行う
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // つまり exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
}

/* Driver Code */
const nums = [
    10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244,
    30524779, 82060337, 63832996,
];
radixSort(nums);
console.log('基数ソート完了後 nums =', nums);

export {};
