/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Перенос одного диска */
void move(List<int> src, List<int> tar) {
  // Снимаем верхний диск с src
  int pan = src.removeLast();
  // Кладём диск на вершину tar
  tar.add(pan);
}

/* Решение задачи о ханойских башнях f(i) */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // Если с src осталось перенести один диск, кладём его сразу на tar
  if (i == 1) {
    move(src, tar);
    return;
  }
  // Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
  dfs(i - 1, src, tar, buf);
  // Подзадача f(1): переносим оставшийся диск с src на tar
  move(src, tar);
  // Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
  dfs(i - 1, buf, src, tar);
}

/* Решение задачи о ханойских башнях */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // Переносим n верхних дисков с A на C с помощью B
  dfs(n, A, B, C);
}

/* Основная программа */
void main() {
  // Последний элемент списка соответствует вершине стержня
  List<int> A = [5, 4, 3, 2, 1];
  List<int> B = [];
  List<int> C = [];
  print("Исходное состояние:");
  print("A = $A");
  print("B = $B");
  print("C = $C");

  solveHanota(A, B, C);

  print("После переноса дисков:");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
