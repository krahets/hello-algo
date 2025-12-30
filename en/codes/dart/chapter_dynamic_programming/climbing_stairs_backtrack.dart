/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // When climbing to the n-th stair, add 1 to the solution count
  if (state == n) {
    res[0]++;
  }
  // Traverse all choices
  for (int choice in choices) {
    // Pruning: not allowed to go beyond the n-th stair
    if (state + choice > n) continue;
    // Attempt: make choice, update state
    backtrack(choices, state + choice, n, res);
    // Backtrack
  }
}

/* Climbing stairs: Backtracking */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // Can choose to climb up 1 or 2 stairs
  int state = 0; // Start climbing from the 0-th stair
  List<int> res = [];
  res.add(0); // Use res[0] to record the solution count
  backtrack(choices, state, n, res);
  return res[0];
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("Climbing $n stairs has $res solutions");
}
