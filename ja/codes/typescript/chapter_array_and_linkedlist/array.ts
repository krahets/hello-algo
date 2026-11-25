/**
 * File: array.ts
 * Created Time: 2022-12-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 要素にランダムにアクセスする */
function randomAccess(nums: number[]): number {
    // 区間 [0, nums.length) から数をランダムに選ぶ
    const random_index = Math.floor(Math.random() * nums.length);
    // ランダムに選んだ要素を取得して返す
    const random_num = nums[random_index];
    return random_num;
}

/* 配列の長さを増やす */
// TypeScript の Array は動的配列なので、そのまま拡張できる
// 学習しやすいように、この関数では Array を固定長の配列として扱う
function extend(nums: number[], enlarge: number): number[] {
    // 長さを増やした配列を初期化する
    const res = new Array(nums.length + enlarge).fill(0);
    // 元の配列の全要素を新しい配列にコピーする
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // 長さを増やした新しい配列を返す
    return res;
}

/* 配列のインデックス index に要素 num を挿入する */
function insert(nums: number[], num: number, index: number): void {
    // インデックス index 以降の全要素を後ろに 1 つずらす
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // インデックス index の要素に num を代入する
    nums[index] = num;
}

/* インデックス index の要素を削除する */
function remove(nums: number[], index: number): void {
    // インデックス index より後ろの全要素を前に 1 つずらす
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 配列を走査する */
function traverse(nums: number[]): void {
    let count = 0;
    // インデックスを使って配列を走査する
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // 配列の要素を直接走査する
    for (const num of nums) {
        count += num;
    }
}

/* 配列から指定した要素を探す */
function find(nums: number[], target: number): number {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) {
            return i;
        }
    }
    return -1;
}

/* ドライバコード */
/* 配列を初期化する */
const arr: number[] = new Array(5).fill(0);
console.log('配列 arr =', arr);
let nums: number[] = [1, 3, 2, 5, 4];
console.log('配列 nums =', nums);

/* ランダムアクセス */
let random_num = randomAccess(nums);
console.log('nums からランダムに選んだ要素：', random_num);

/* 配列の長さを増やす */
nums = extend(nums, 3);
console.log('配列の長さを 8 に増やした後の nums =', nums);

/* 要素を挿入する */
insert(nums, 6, 3);
console.log('インデックス 3 に 6 を挿入した後の nums =', nums);

/* 要素を削除する */
remove(nums, 2);
console.log('インデックス 2 の要素を削除した後の nums =', nums);

/* 配列を走査する */
traverse(nums);

/* 要素を探す */
let index = find(nums, 3);
console.log('nums で要素 3 が見つかったインデックス =', index);

export {};
