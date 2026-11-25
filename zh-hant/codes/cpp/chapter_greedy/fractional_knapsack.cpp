/**
 * File: fractional_knapsack.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 物品 */
class Item {
  public:
    int w; // 物品重量
    int v; // 物品價值

    Item(int w, int v) : w(w), v(v) {
    }
};

/* 分數背包：貪婪法 */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // 建立物品清單，每件物品有重量與價值兩項屬性
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // 依單位價值 item.v / item.w 由高到低排序
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // 反覆依貪婪策略選取物品
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // 若剩餘容量足夠，就將目前的物品整件裝入背包
            res += item.v;
            cap -= item.w;
        } else {
            // 若剩餘容量不足，就將目前物品的一部分裝入背包
            res += (double)item.v / item.w * cap;
            // 背包已滿，跳出迴圈
            break;
        }
    }
    return res;
}

/* 主程式 */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;

    // 貪婪演算法
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "在背包容量限制內，物品的最大總價值為 " << res << endl;

    return 0;
}
