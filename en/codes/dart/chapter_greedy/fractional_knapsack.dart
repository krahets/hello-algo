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

/* Fractional knapsack: greedy algorithm */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // Create a list of items, each with two attributes: weight and value
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // Sort by value per unit weight, item.v / item.w, in descending order
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // Repeatedly make greedy choices
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // If enough capacity remains, put the entire current item in the knapsack
      res += item.v;
      cap -= item.w;
    } else {
      // If the remaining capacity is insufficient, put part of the current item in the knapsack
      res += item.v / item.w * cap;
      // No capacity remains, so exit the loop
      break;
    }
  }
  return res;
}

/* Driver code */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;

  // Greedy algorithm
  double res = fractionalKnapsack(wgt, val, cap);
  print("Maximum total item value within the knapsack capacity: $res");
}
