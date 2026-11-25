"""
File: recursion.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def recur(n: int) -> int:
    """Recursion"""
    # Base case
    if n == 1:
        return 1
    # Descend: make a recursive call
    res = recur(n - 1)
    # Unwind: return the result
    return n + res


def for_loop_recur(n: int) -> int:
    """Simulate recursion with iteration"""
    # Use an explicit stack to simulate the call stack
    stack = []
    res = 0
    # Descend: make a recursive call
    for i in range(n, 0, -1):
        # Push to simulate descending
        stack.append(i)
    # Unwind: return the result
    while stack:
        # Pop to simulate unwinding
        res += stack.pop()
    # res = 1+2+3+...+n
    return res


def tail_recur(n, res):
    """Tail recursion"""
    # Base case
    if n == 0:
        return res
    # Tail call
    return tail_recur(n - 1, res + n)


def fib(n: int) -> int:
    """Fibonacci sequence using recursion"""
    # Base cases: f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # Recursive calls: f(n) = f(n-1) + f(n-2)
    res = fib(n - 1) + fib(n - 2)
    # Return the result f(n)
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = recur(n)
    print(f"\nRecursive sum: res = {res}")

    res = for_loop_recur(n)
    print(f"\nSum using simulated recursion: res = {res}")

    res = tail_recur(n, 0)
    print(f"\nTail-recursive sum: res = {res}")

    res = fib(n)
    print(f"\nFibonacci term {n} is {res}")
