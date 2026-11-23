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

/* Fractional knapsack: greedy algorithm */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // Create a list of items, each with two attributes: weight and value
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // Sort by value per unit weight, item.v / item.w, in descending order
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // Repeatedly make greedy choices
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // If enough capacity remains, put the entire current item in the knapsack
            res += item.v;
            cap -= item.w;
        } else {
            // If the remaining capacity is insufficient, put part of the current item in the knapsack
            res += (double)item.v / item.w * cap;
            // No capacity remains, so exit the loop
            break;
        }
    }
    return res;
}

/* Driver code */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;

    // Greedy algorithm
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "Maximum total item value within the knapsack capacity: " << res << endl;

    return 0;
}
