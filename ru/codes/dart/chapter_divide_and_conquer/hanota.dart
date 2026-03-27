/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Переместить один диск */
void move(List<int> src, List<int> tar) {
  // Снять диск с вершины src
  int pan = src.removeLast();
  // Положить диск на вершину tar
  tar.add(pan);
}

/* Решить задачу Ханойской башни f(i) */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // Если в src остался только один диск, сразу переместить его в tar
  if (i == 1) {
    move(src, tar);
    return;
  }
  // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
  dfs(i - 1, src, tar, buf);
  // Подзадача f(1): переместить оставшийся один диск из src в tar
  move(src, tar);
  // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
  dfs(i - 1, buf, src, tar);
}

/* Решить задачу Ханойской башни */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // Переместить верхние n дисков из A в C с помощью B
  dfs(n, A, B, C);
}

/* Driver Code */
void main() {
  // Хвост списка соответствует вершине столбца
  List<int> A = [5, 4, 3, 2, 1];
  List<int> B = [];
  List<int> C = [];
  print("Исходное состояние:");
  print("A = $A");
  print("B = $B");
  print("C = $C");

  solveHanota(A, B, C);

  print("После завершения перемещения дисков:");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
