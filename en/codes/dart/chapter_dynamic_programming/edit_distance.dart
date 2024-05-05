/**
 * File: edit_distance.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Edit distance: Brute force search */
int editDistanceDFS(String s, String t, int i, int j) {
  // If both s and t are empty, return 0
  if (i == 0 && j == 0) return 0;
  // If s is empty, return the length of t
  if (i == 0) return j;
  // If t is empty, return the length of s
  if (j == 0) return i;
  // If the two characters are equal, skip these two characters
  if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1);
  // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
  int insert = editDistanceDFS(s, t, i, j - 1);
  int delete = editDistanceDFS(s, t, i - 1, j);
  int replace = editDistanceDFS(s, t, i - 1, j - 1);
  // Return the minimum number of edits
  return min(min(insert, delete), replace) + 1;
}

/* Edit distance: Memoized search */
int editDistanceDFSMem(String s, String t, List<List<int>> mem, int i, int j) {
  // If both s and t are empty, return 0
  if (i == 0 && j == 0) return 0;
  // If s is empty, return the length of t
  if (i == 0) return j;
  // If t is empty, return the length of s
  if (j == 0) return i;
  // If there is a record, return it
  if (mem[i][j] != -1) return mem[i][j];
  // If the two characters are equal, skip these two characters
  if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
  int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
  int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
  int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // Record and return the minimum number of edits
  mem[i][j] = min(min(insert, delete), replace) + 1;
  return mem[i][j];
}

/* Edit distance: Dynamic programming */
int editDistanceDP(String s, String t) {
  int n = s.length, m = t.length;
  List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));
  // State transition: first row and first column
  for (int i = 1; i <= n; i++) {
    dp[i][0] = i;
  }
  for (int j = 1; j <= m; j++) {
    dp[0][j] = j;
  }
  // State transition: the rest of the rows and columns
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= m; j++) {
      if (s[i - 1] == t[j - 1]) {
        // If the two characters are equal, skip these two characters
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
        dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
      }
    }
  }
  return dp[n][m];
}

/* Edit distance: Space-optimized dynamic programming */
int editDistanceDPComp(String s, String t) {
  int n = s.length, m = t.length;
  List<int> dp = List.filled(m + 1, 0);
  // State transition: first row
  for (int j = 1; j <= m; j++) {
    dp[j] = j;
  }
  // State transition: the rest of the rows
  for (int i = 1; i <= n; i++) {
    // State transition: first column
    int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
    dp[0] = i;
    // State transition: the rest of the columns
    for (int j = 1; j <= m; j++) {
      int temp = dp[j];
      if (s[i - 1] == t[j - 1]) {
        // If the two characters are equal, skip these two characters
        dp[j] = leftup;
      } else {
        // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
        dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
      }
      leftup = temp; // Update for the next round of dp[i-1, j-1]
    }
  }
  return dp[m];
}

/* Driver Code */
void main() {
  String s = "bag";
  String t = "pack";
  int n = s.length, m = t.length;

  // Brute force search
  int res = editDistanceDFS(s, t, n, m);
  print("Minimum edits required to change " + s + " to " + t + " = $res steps");

  // Memoized search
  List<List<int>> mem = List.generate(n + 1, (_) => List.filled(m + 1, -1));
  res = editDistanceDFSMem(s, t, mem, n, m);
  print("Minimum edits required to change " + s + " to " + t + " = $res steps");

  // Dynamic programming
  res = editDistanceDP(s, t);
  print("Minimum edits required to change " + s + " to " + t + " = $res steps");

  // Space-optimized dynamic programming
  res = editDistanceDPComp(s, t);
  print("Minimum edits required to change " + s + " to " + t + " = $res steps");
}
