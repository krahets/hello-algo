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
  // Создаём список предметов с двумя свойствами: весом и стоимостью
  List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
  // Сортируем по убыванию удельной стоимости item.v / item.w
  items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
  // На каждом шаге делаем жадный выбор
  double res = 0;
  for (Item item in items) {
    if (item.w <= cap) {
      // Если места достаточно, кладём предмет целиком
      res += item.v;
      cap -= item.w;
    } else {
      // Если места недостаточно, кладём часть предмета
      res += item.v / item.w * cap;
      // Рюкзак заполнен, выходим из цикла
      break;
    }
  }
  return res;
}

/* Пример запуска */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;

  // Жадный алгоритм
  double res = fractionalKnapsack(wgt, val, cap);
  print("Максимальная стоимость при заданной вместимости рюкзака: $res");
}
