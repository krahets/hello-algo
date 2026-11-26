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

/* Greedy fractional knapsack */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // Create a list of items, each with a weight and a value
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // Sort by value per unit of weight, item.v / item.w, in descending order
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // Make greedy choices in a loop
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // If the whole item fits, put it in the knapsack
            res += item.v;
            cap -= item.w;
        } else {
            // If the whole item does not fit, take a fraction of it
            res += (double)item.v / item.w * cap;
            // The knapsack is full, so exit the loop
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
    cout << "The maximum total value within the weight limit is " << res << endl;

    return 0;
}
