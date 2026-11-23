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

/* 分割可能ナップサック問題：貪欲法 */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // 重さと価値の 2 つの属性を持つ品物のリストを作成する
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // 単位重さ当たりの価値 item.v / item.w の降順にソートする
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // 貪欲な選択を繰り返す
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
      res += item.v;
      cap -= item.w;
    } else {
      // 残り容量が不足している場合、現在の品物の一部をナップサックに入れる
      res += item.v / item.w * cap;
      // 残り容量がないため、ループを終了する
      break;
    }
  }
  return res;
}

/* 実行用コード */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;

  // 貪欲アルゴリズム
  double res = fractionalKnapsack(wgt, val, cap);
  print("ナップサックの容量を超えない品物の最大価値は $res");
}
