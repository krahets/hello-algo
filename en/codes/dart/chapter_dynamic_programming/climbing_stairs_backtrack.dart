/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // When step n is reached, increase the number of ways by 1
  if (state == n) {
    res[0]++;
  }
  // Iterate over all choices
  for (int choice in choices) {
    // Prune: do not go beyond step n
    if (state + choice > n) continue;
    // Try: make a choice and update the state
    backtrack(choices, state + choice, n, res);
    // Backtrack
  }
}

/* Climbing stairs: backtracking */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // Choose to climb 1 or 2 steps
  int state = 0; // Start climbing from step 0
  List<int> res = [];
  res.add(0); // Use res[0] to record the number of ways
  backtrack(choices, state, n, res);
  return res[0];
}

/* Driver code */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("Number of ways to climb $n stairs: $res");
}
