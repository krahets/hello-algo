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

/* Greedy fractional knapsack */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // Create a list of items, each with a weight and a value
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // Sort by value per unit of weight, item.v / item.w, in descending order
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // Make greedy choices in a loop
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // If the whole item fits, put it in the knapsack
      res += item.v;
      cap -= item.w;
    } else {
      // If the whole item does not fit, take a fraction of it
      res += item.v / item.w * cap;
      // The knapsack is full, so exit the loop
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
  print("The maximum total value within the weight limit is $res");
}
