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

/* 分数ナップサック：貪欲法 */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // 重さと価値の 2 属性を持つ品物リストを作成
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // 単位価値 item.v / item.w の高い順にソートする
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // 貪欲選択を繰り返す
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += item.v;
            cap -= item.w;
        } else {
            // 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
            res += (double)item.v / item.w * cap;
            // 残り容量がないため、ループを抜ける
            break;
        }
    }
    return res;
}

/* Driver Code */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;

    // 貪欲法
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "ナップサック容量を超えない最大価値は " << res << endl;

    return 0;
}
