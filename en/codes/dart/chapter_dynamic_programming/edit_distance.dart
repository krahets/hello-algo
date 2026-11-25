/**
 * File: edit_distance.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Edit distance with brute-force search */
int editDistanceDFS(String s, String t, int i, int j) {
  // Return 0 if both s and t are empty
  if (i == 0 && j == 0) return 0;
  // Return the length of t if s is empty
  if (i == 0) return j;
  // Return the length of s if t is empty
  if (j == 0) return i;
  // Skip both characters if they match
  if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1);
  // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
  int insert = editDistanceDFS(s, t, i, j - 1);
  int delete = editDistanceDFS(s, t, i - 1, j);
  int replace = editDistanceDFS(s, t, i - 1, j - 1);
  // Return the minimum number of edits
  return min(min(insert, delete), replace) + 1;
}

/* Edit distance with memoized search */
int editDistanceDFSMem(String s, String t, List<List<int>> mem, int i, int j) {
  // Return 0 if both s and t are empty
  if (i == 0 && j == 0) return 0;
  // Return the length of t if s is empty
  if (i == 0) return j;
  // Return the length of s if t is empty
  if (j == 0) return i;
  // Return the cached result if available
  if (mem[i][j] != -1) return mem[i][j];
  // Skip both characters if they match
  if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
  int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
  int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
  int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // Cache and return the minimum number of edits
  mem[i][j] = min(min(insert, delete), replace) + 1;
  return mem[i][j];
}

/* Edit distance with dynamic programming */
int editDistanceDP(String s, String t) {
  int n = s.length, m = t.length;
  List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));
  // State transitions for the first row and column
  for (int i = 1; i <= n; i++) {
    dp[i][0] = i;
  }
  for (int j = 1; j <= m; j++) {
    dp[0][j] = j;
  }
  // State transitions for the remaining rows and columns
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= m; j++) {
      if (s[i - 1] == t[j - 1]) {
        // Skip both characters if they match
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
        dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
      }
    }
  }
  return dp[n][m];
}

/* Edit distance with space-optimized dynamic programming */
int editDistanceDPComp(String s, String t) {
  int n = s.length, m = t.length;
  List<int> dp = List.filled(m + 1, 0);
  // State transitions for the first row
  for (int j = 1; j <= m; j++) {
    dp[j] = j;
  }
  // State transitions for the remaining rows
  for (int i = 1; i <= n; i++) {
    // State transitions for the first column
    int leftup = dp[0]; // Save dp[i-1, j-1] temporarily
    dp[0] = i;
    // State transitions for the remaining columns
    for (int j = 1; j <= m; j++) {
      int temp = dp[j];
      if (s[i - 1] == t[j - 1]) {
        // Skip both characters if they match
        dp[j] = leftup;
      } else {
        // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
        dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
      }
      leftup = temp; // Update the saved value to hold dp[i-1, j-1] for the next iteration
    }
  }
  return dp[m];
}

/* Driver code */
void main() {
  String s = "bag";
  String t = "pack";
  int n = s.length, m = t.length;

  // Brute-force search
  int res = editDistanceDFS(s, t, n, m);
  print("Changing " + s + " to " + t + " requires at least $res edits");

  // Memoized search
  List<List<int>> mem = List.generate(n + 1, (_) => List.filled(m + 1, -1));
  res = editDistanceDFSMem(s, t, mem, n, m);
  print("Changing " + s + " to " + t + " requires at least $res edits");

  // Dynamic programming
  res = editDistanceDP(s, t);
  print("Changing " + s + " to " + t + " requires at least $res edits");

  // Space-optimized dynamic programming
  res = editDistanceDPComp(s, t);
  print("Changing " + s + " to " + t + " requires at least $res edits");
}
