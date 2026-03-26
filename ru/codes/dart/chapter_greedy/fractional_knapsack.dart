/**
 * File: fractional_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Предмет */
class Item {
  int w; // Вес предмета
  int v; // Стоимость предмета

  Item(this.w, this.v);
}

/* Дробный рюкзак: жадный алгоритм */
double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
  // Создать список предметов с двумя свойствами: вес и стоимость
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // Отсортировать по удельной стоимости item.v / item.w в порядке убывания
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // Циклический жадный выбор
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // Если оставшейся вместимости достаточно, поместить текущий предмет в рюкзак целиком
      res += item.v;
      cap -= item.w;
    } else {
      // Если оставшейся вместимости недостаточно, поместить в рюкзак часть текущего предмета
      res += item.v / item.w * cap;
      // Оставшейся вместимости больше нет, поэтому выйти из цикла
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

  // Жадный алгоритм
  double res = fractionalKnapsack(wgt, val, cap);
  print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна $res");
}
