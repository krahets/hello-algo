/**
 * File: fractional_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 物品 */
class Item {
  int w; // 物品重量
  int v; // 物品价值

  Item(this.w, this.v);
}

/* 分数背包：贪心 */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // 创建物品列表，包含两个属性：重量、价值
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // 按照单位价值 item.v / item.w 从高到低进行排序
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // 循环贪心选择
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // 若剩余容量充足，则将当前物品整个装进背包
      res += item.v;
      cap -= item.w;
    } else {
      // 若剩余容量不足，则将当前物品的一部分装进背包
      res += item.v / item.w * cap;
      // 已无剩余容量，因此跳出循环
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

  // 贪心算法
  double res = fractionalKnapsack(wgt, val, cap);
  print("不超过背包容量的最大物品价值为 $res");
}
