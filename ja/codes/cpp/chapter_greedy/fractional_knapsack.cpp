/**
 * File: fractional_knapsack.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 品物 */
class Item {
  public:
    int w; // 品物の重さ
    int v; // 品物の価値

    Item(int w, int v) : w(w), v(v) {
    }
};

/* 分割可能ナップサック問題：貪欲法 */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // 重さと価値の 2 つの属性を持つ品物のリストを作成する
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // 単位重さ当たりの価値 item.v / item.w の降順にソートする
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // 貪欲な選択を繰り返す
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += item.v;
            cap -= item.w;
        } else {
            // 残り容量が不足している場合、現在の品物の一部をナップサックに入れる
            res += (double)item.v / item.w * cap;
            // 残り容量がないため、ループを終了する
            break;
        }
    }
    return res;
}

/* 実行用コード */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;

    // 貪欲アルゴリズム
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "ナップサックの容量を超えない品物の最大価値は " << res << endl;

    return 0;
}
