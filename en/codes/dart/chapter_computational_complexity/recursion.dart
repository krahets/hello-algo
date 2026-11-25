/**
 * File: recursion.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Recursion */
int recur(int n) {
  // Base case
  if (n == 1) return 1;
  // Descend: make a recursive call
  int res = recur(n - 1);
  // Unwind: return the result
  return n + res;
}

/* Simulate recursion with iteration */
int forLoopRecur(int n) {
  // Use an explicit stack to simulate the call stack
  List<int> stack = [];
  int res = 0;
  // Descend: make a recursive call
  for (int i = n; i > 0; i--) {
    // Push to simulate descending
    stack.add(i);
  }
  // Unwind: return the result
  while (!stack.isEmpty) {
    // Pop to simulate unwinding
    res += stack.removeLast();
  }
  // res = 1+2+3+...+n
  return res;
}

/* Tail recursion */
int tailRecur(int n, int res) {
  // Base case
  if (n == 0) return res;
  // Tail call
  return tailRecur(n - 1, res + n);
}

/* Fibonacci sequence using recursion */
int fib(int n) {
  // Base cases: f(1) = 0, f(2) = 1
  if (n == 1 || n == 2) return n - 1;
  // Recursive calls: f(n) = f(n-1) + f(n-2)
  int res = fib(n - 1) + fib(n - 2);
  // Return the result f(n)
  return res;
}

/* Driver Code */
void main() {
  int n = 5;
  int res;

  res = recur(n);
  print("\nRecursive sum: res = $res");

  res = tailRecur(n, 0);
  print("\nTail-recursive sum: res = $res");

  res = forLoopRecur(n);
  print("\nSum using simulated recursion: res = $res");

  res = fib(n);
  print("\nFibonacci term $n is $res");
}
