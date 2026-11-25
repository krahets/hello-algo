/**
 * File: counting_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* カウントソート */
// 簡易版。オブジェクトのソートには使えない
function countingSortNaive(nums: number[]): void {
    // 1. 配列の最大値 m を求める
    let m: number = Math.max(...nums);
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    const counter: number[] = new Array<number>(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. counter を走査し、各要素を元の配列 nums に書き込む
    let i = 0;
    for (let num = 0; num < m + 1; num++) {
        for (let j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* カウントソート */
// 完全版。オブジェクトもソートでき、安定性を保つ
function countingSort(nums: number[]): void {
    // 1. 配列の最大値 m を求める
    let m: number = Math.max(...nums);
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    const counter: number[] = new Array<number>(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
    // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
    for (let i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
    // 結果を格納する配列 res を初期化
    const n = nums.length;
    const res: number[] = new Array<number>(n);
    for (let i = n - 1; i >= 0; i--) {
        const num = nums[i];
        res[counter[num] - 1] = num; // num を対応するインデックスに配置
        counter[num]--; // 累積和を 1 減らして、次に num を置く位置を求める
    }
    // 結果配列 res で元の配列 nums を上書き
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* 実行例 */
const nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSortNaive(nums);
console.log('カウントソート（オブジェクトは対象外）後の nums =', nums);

const nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSort(nums1);
console.log('カウントソート後の nums1 =', nums1);

export {};
