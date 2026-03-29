/**
 * File: max_capacity.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 最大容量：貪欲法 */
int maxCapacity(vector<int> &ht) {
    // i, j を初期化し、それぞれ配列の両端に置く
    int i = 0, j = ht.size() - 1;
    // 初期の最大容量は 0
    int res = 0;
    // 2 枚の板が出会うまで貪欲選択を繰り返す
    while (i < j) {
        // 最大容量を更新する
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // 短い方を内側へ動かす
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver Code */
int main() {
    vector<int> ht = {3, 8, 5, 2, 7, 7, 3, 4};

    // 貪欲法
    int res = maxCapacity(ht);
    cout << "最大容量は " << res << endl;

    return 0;
}
