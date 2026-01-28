/**
 * File: fractional_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Item */
class Item {
  int w; // Item weight
  int v; // Item value

  Item(this.w, this.v);
}

/* Fractional knapsack: Greedy algorithm */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // Create item list with two attributes: weight, value
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // Sort by unit value item.v / item.w from high to low
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // Loop for greedy selection
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // If remaining capacity is sufficient, put the entire current item into the knapsack
      res += item.v;
      cap -= item.w;
    } else {
      // If remaining capacity is insufficient, put part of the current item into the knapsack
      res += item.v / item.w * cap;
      // No remaining capacity, so break out of the loop
      break;
    }
  }
  return res;
}

/* Driver Code */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;

  // Greedy algorithm
  double res = fractionalKnapsack(wgt, val, cap);
  print("Maximum item value not exceeding knapsack capacity is $res");
}
