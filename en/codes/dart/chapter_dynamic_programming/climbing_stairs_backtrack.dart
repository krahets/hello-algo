/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // Count one more way when we reach stair n
  if (state == n) {
    res[0]++;
  }
  // Iterate over all choices
  for (int choice in choices) {
    // Prune moves that would overshoot stair n
    if (state + choice > n) continue;
    // Try a choice and update the state
    backtrack(choices, state + choice, n, res);
    // Undo the choice
  }
}

/* Climbing stairs with backtracking */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // Each move can climb 1 or 2 stairs
  int state = 0; // Start at stair 0
  List<int> res = [];
  res.add(0); // Store the number of ways in res[0]
  backtrack(choices, state, n, res);
  return res[0];
}

/* Driver code */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("Climbing $n stairs: $res ways");
}
