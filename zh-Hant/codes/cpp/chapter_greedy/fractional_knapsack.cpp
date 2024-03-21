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

/* 分數背包：貪婪 */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // 建立物品串列，包含兩個屬性：重量、價值
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // 按照單位價值 item.v / item.w 從高到低進行排序
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // 迴圈貪婪選擇
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // 若剩餘容量充足，則將當前物品整個裝進背包
            res += item.v;
            cap -= item.w;
        } else {
            // 若剩餘容量不足，則將當前物品的一部分裝進背包
            res += (double)item.v / item.w * cap;
            // 已無剩餘容量，因此跳出迴圈
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

    // 貪婪演算法
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "不超過背包容量的最大物品價值為 " << res << endl;

    return 0;
}
