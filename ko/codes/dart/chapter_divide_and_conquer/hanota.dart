/**
 * File: hanota.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 원판 하나를 옮긴다 */
void move(List<int> src, List<int> tar) {
  // src 맨 위의 원판 하나를 꺼낸다
  int pan = src.removeLast();
  // 원판을 tar 맨 위에 놓는다
  tar.add(pan);
}

/* 하노이의 탑 문제 f(i)를 푼다 */
void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
  // src에 원판 하나만 남으면 바로 tar로 옮긴다
  if (i == 1) {
    move(src, tar);
    return;
  }
  // 부분 문제 f(i-1): tar를 보조 기둥으로 써서 src 위의 원판 i-1개를 buf로 옮긴다
  dfs(i - 1, src, tar, buf);
  // 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
  move(src, tar);
  // 부분 문제 f(i-1): src를 보조 기둥으로 써서 buf 위의 원판 i-1개를 tar로 옮긴다
  dfs(i - 1, buf, src, tar);
}

/* 하노이의 탑 문제 풀기 */
void solveHanota(List<int> A, List<int> B, List<int> C) {
  int n = A.length;
  // B를 보조 기둥으로 써서 A 위의 원판 n개를 C로 옮긴다
  dfs(n, A, B, C);
}

/* 실행 코드 */
void main() {
  // 리스트의 끝이 기둥의 맨 위에 해당한다
  List<int> A = [5, 4, 3, 2, 1];
  List<int> B = [];
  List<int> C = [];
  print("초기 상태:");
  print("A = $A");
  print("B = $B");
  print("C = $C");

  solveHanota(A, B, C);

  print("원판 이동 완료 후:");
  print("A = $A");
  print("B = $B");
  print("C = $C");
}
