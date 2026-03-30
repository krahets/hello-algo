/**
 * File: max_capacity.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 最大容量：貪欲法 */
function maxCapacity(ht) {
    // i, j を初期化し、それぞれ配列の両端に置く
    let i = 0,
        j = ht.length - 1;
    // 初期の最大容量は 0
    let res = 0;
    // 2 枚の板が出会うまで貪欲選択を繰り返す
    while (i < j) {
        // 最大容量を更新する
        const cap = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // 短い方を内側へ動かす
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* Driver Code */
const ht = [3, 8, 5, 2, 7, 7, 3, 4];

// 貪欲法
const res = maxCapacity(ht);
console.log(`最大容量は ${res}`);
