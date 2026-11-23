/**
 * File: fractional_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 물건 */
class Item {
  int w; // 물건의 무게
  int v; // 물건의 가치

  Item(this.w, this.v);
}

/* 분할 가능한 배낭: 탐욕 */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // 무게와 가치 두 속성을 갖는 물건의 리스트를 생성한다
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // 탐욕적 선택을 반복한다
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 넣는다
      res += item.v;
      cap -= item.w;
    } else {
      // 남은 용량이 부족하면 현재 물건의 일부를 배낭에 넣는다
      res += item.v / item.w * cap;
      // 남은 용량이 없으므로 반복문을 종료한다
      break;
    }
  }
  return res;
}

/* 실행 코드 */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;

  // 탐욕 알고리즘
  double res = fractionalKnapsack(wgt, val, cap);
  print("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = $res");
}
