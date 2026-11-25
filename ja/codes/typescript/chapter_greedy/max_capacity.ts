/**
 * File: max_capacity.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 最大容量（貪欲法） */
function maxCapacity(ht: number[]): number {
    // i と j を配列の両端に置く
    let i = 0,
        j = ht.length - 1;
    // 最大容量の初期値は 0
    let res = 0;
    // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
    while (i < j) {
        // 最大容量を更新する
        const cap: number = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // 低い板のポインタを内側へ動かす
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* 実行例 */
const ht: number[] = [3, 8, 5, 2, 7, 7, 3, 4];

// 貪欲法
const res: number = maxCapacity(ht);
console.log(`最大容量は ${res}`);

export {};
