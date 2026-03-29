/**
 * File: fractional_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 品物 */
class Item {
  int w; // 品物の重さ
  int v; // 品物の価値

  Item(this.w, this.v);
}

/* 分数ナップサック：貪欲法 */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // 重さと価値の 2 属性を持つ品物リストを作成
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // 単位価値 item.v / item.w の高い順にソートする
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // 貪欲選択を繰り返す
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
      res += item.v;
      cap -= item.w;
    } else {
      // 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
      res += item.v / item.w * cap;
      // 残り容量がないため、ループを抜ける
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

  // 貪欲法
  double res = fractionalKnapsack(wgt, val, cap);
  print("ナップサック容量を超えない最大価値は $res");
}
