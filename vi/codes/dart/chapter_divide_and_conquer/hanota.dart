/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Move a disk */
void move(List<int> src, List<int> tar) {
  // Take out a disk from the top of src
  int pan = src.removeLast();
  // Place the disk on top of tar
  tar.add(pan);
}

/* Solve the Tower of Hanoi problem f(i) */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // If there is only one disk left in src, move it directly to tar
  if (i == 1) {
    move(src, tar);
    return;
  }
  // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
  dfs(i - 1, src, tar, buf);
  // Subproblem f(1): move the remaining disk from src to tar
  move(src, tar);
  // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
  dfs(i - 1, buf, src, tar);
}

/* Solve the Tower of Hanoi problem */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // Move the top n disks from A to C using B
  dfs(n, A, B, C);
}

/* Driver Code */
void main() {
  // The tail of the list is the top of the rod
  List<int> A = [5, 4, 3, 2, 1];
  List<int> B = [];
  List<int> C = [];
  print("In initial state:");
  print("A = $A");
  print("B = $B");
  print("C = $C");

  solveHanota(A, B, C);

  print("After disk movement is complete:");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
