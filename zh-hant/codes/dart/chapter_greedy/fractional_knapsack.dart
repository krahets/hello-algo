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

/* 分數背包：貪婪法 */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // 建立物品清單，每件物品有重量與價值兩項屬性
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // 依單位價值 item.v / item.w 由高到低排序
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // 反覆依貪婪策略選取物品
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // 若剩餘容量足夠，就將目前的物品整件裝入背包
      res += item.v;
      cap -= item.w;
    } else {
      // 若剩餘容量不足，就將目前物品的一部分裝入背包
      res += item.v / item.w * cap;
      // 背包已滿，跳出迴圈
      break;
    }
  }
  return res;
}

/* 主程式 */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;

  // 貪婪演算法
  double res = fractionalKnapsack(wgt, val, cap);
  print("在背包容量限制內，物品的最大總價值為 $res");
}
