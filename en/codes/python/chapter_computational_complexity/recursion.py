"""
File: recursion.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def recur(n: int) -> int:
    """Recursion"""
    # Termination condition
    if n == 1:
        return 1
    # Recursive: recursive call
    res = recur(n - 1)
    # Return: return result
    return n + res


def for_loop_recur(n: int) -> int:
    """Simulate recursion with iteration"""
    # Use an explicit stack to simulate the system call stack
    stack = []
    res = 0
    # Recursive: recursive call
    for i in range(n, 0, -1):
        # Simulate "recursive" by "pushing onto the stack"
        stack.append(i)
    # Return: return result
    while stack:
        # Simulate "return" by "popping from the stack"
        res += stack.pop()
    # res = 1+2+3+...+n
    return res


def tail_recur(n, res):
    """Tail recursion"""
    # Termination condition
    if n == 0:
        return res
    # Tail recursive call
    return tail_recur(n - 1, res + n)


def fib(n: int) -> int:
    """Fibonacci sequence: Recursion"""
    # Termination condition f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # Recursive call f(n) = f(n-1) + f(n-2)
    res = fib(n - 1) + fib(n - 2)
    # Return result f(n)
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = recur(n)
    print(f"\nRecursive function sum result res = {res}")

    res = for_loop_recur(n)
    print(f"\nSimulate recursion with iteration sum result res = {res}")

    res = tail_recur(n, 0)
    print(f"\nTail recursive function sum result res = {res}")

    res = fib(n)
    print(f"\nThe n th term of the Fibonacci sequence is {res}")
