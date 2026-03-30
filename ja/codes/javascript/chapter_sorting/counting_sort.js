/**
 * File: counting_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* 計数ソート */
// 簡易実装のため、オブジェクトのソートには使えない
function countingSortNaive(nums) {
    // 1. 配列の最大要素 m を求める
    let m = Math.max(...nums);
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. counter を走査し、各要素を元の配列 nums に書き戻す
    let i = 0;
    for (let num = 0; num < m + 1; num++) {
        for (let j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* 計数ソート */
// 完全な実装で、オブジェクトをソートでき、かつ安定ソートである
function countingSort(nums) {
    // 1. 配列の最大要素 m を求める
    let m = Math.max(...nums);
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. counter の累積和を求めて、「出現回数」を「末尾インデックス」に変換する
    // つまり counter[num]-1 は、num が res に最後に現れるインデックス
    for (let i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. nums を逆順に走査し、各要素を結果配列 res に格納する
    // 結果を記録するための配列 res を初期化
    const n = nums.length;
    const res = new Array(n);
    for (let i = n - 1; i >= 0; i--) {
        const num = nums[i];
        res[counter[num] - 1] = num; // num を対応するインデックスに配置
        counter[num]--; // 累積和を 1 減らして、次に num を配置するインデックスを得る
    }
    // 結果配列 res で元の配列 nums を上書きする
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Driver Code */
const nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSortNaive(nums);
console.log('カウントソート（オブジェクトはソート不可）完了後 nums =', nums);

const nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSort(nums1);
console.log('カウントソート完了後 nums1 =', nums1);
