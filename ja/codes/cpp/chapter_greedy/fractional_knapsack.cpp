/**
 * File: fractional_knapsack.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* アイテム */
class Item {
  public:
    int w; // アイテムの重量
    int v; // アイテムの価値

    Item(int w, int v) : w(w), v(v) {
    }
};

/* 分数ナップサック：貪欲法 */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // アイテムリストを作成、2つの属性を含む：重量、価値
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // 単位価値 item.v / item.w で高い順にソート
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // 貪欲選択をループ
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // 残り容量が十分な場合、アイテム全体をナップサックに入れる
            res += item.v;
            cap -= item.w;
        } else {
            // 残り容量が不十分な場合、アイテムの一部をナップサックに入れる
            res += (double)item.v / item.w * cap;
            // 残り容量がなくなったため、ループを中断
            break;
        }
    }
    return res;
}

/* ドライバーコード */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;

    // 貪欲アルゴリズム
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "ナップサック容量内での最大値は " << res << " です" << endl;

    return 0;
}