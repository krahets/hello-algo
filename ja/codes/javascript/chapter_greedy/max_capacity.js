/**
 * File: max_capacity.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 最大容量：貪欲法 */
function maxCapacity(ht) {
    // i, j を初期化し、配列の両端をそれぞれ指すようにする
    let i = 0,
        j = ht.length - 1;
    // 最大容量の初期値は 0
    let res = 0;
    // 2 枚の板が出会うまで貪欲な選択を繰り返す
    while (i < j) {
        // 最大容量を更新する
        const cap = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // 低い方の仕切り板を内側に移動する
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* 実行用コード */
const ht = [3, 8, 5, 2, 7, 7, 3, 4];

// 貪欲アルゴリズム
const res = maxCapacity(ht);
console.log(`最大容量は ${res}`);
