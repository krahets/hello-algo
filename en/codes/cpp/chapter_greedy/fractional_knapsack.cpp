/**
 * File: fractional_knapsack.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Item */
class Item {
  public:
    int w; // Item weight
    int v; // Item value

    Item(int w, int v) : w(w), v(v) {
    }
};

/* Fractional knapsack: Greedy */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // Create an item list, containing two properties: weight, value
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // Sort by unit value item.v / item.w from high to low
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // Loop for greedy selection
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // If the remaining capacity is sufficient, put the entire item into the knapsack
            res += item.v;
            cap -= item.w;
        } else {
            // If the remaining capacity is insufficient, put part of the item into the knapsack
            res += (double)item.v / item.w * cap;
            // No remaining capacity left, thus break the loop
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

    // Greedy algorithm
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "The maximum value within the bag capacity is " << res << endl;

    return 0;
}
