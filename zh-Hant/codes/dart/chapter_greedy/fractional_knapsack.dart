/**
 * File: fractional_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 物品 */
class Item {
  int w; // 物品重量
  int v; // 物品價值

  Item(this.w, this.v);
}

/* 分數背包：貪婪 */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // 建立物品串列，包含兩個屬性：重量、價值
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // 按照單位價值 item.v / item.w 從高到低進行排序
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // 迴圈貪婪選擇
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // 若剩餘容量充足，則將當前物品整個裝進背包
      res += item.v;
      cap -= item.w;
    } else {
      // 若剩餘容量不足，則將當前物品的一部分裝進背包
      res += item.v / item.w * cap;
      // 已無剩餘容量，因此跳出迴圈
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

  // 貪婪演算法
  double res = fractionalKnapsack(wgt, val, cap);
  print("不超過背包容量的最大物品價值為 $res");
}
