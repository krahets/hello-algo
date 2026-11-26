"""
File: recursion.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def recur(n: int) -> int:
    """재귀"""
    # 종료 조건
    if n == 1:
        return 1
    # 내려가는 단계: 재귀 호출
    res = recur(n - 1)
    # 돌아오는 단계: 결과 반환
    return n + res


def for_loop_recur(n: int) -> int:
    """반복으로 재귀 구현하기"""
    # 명시적인 스택으로 시스템 호출 스택을 모방한다
    stack = []
    res = 0
    # 내려가는 단계: 재귀 호출
    for i in range(n, 0, -1):
        # 스택에 값을 넣어 재귀 호출 단계를 재현한다
        stack.append(i)
    # 돌아오는 단계: 결과 반환
    while stack:
        # 스택에서 값을 꺼내 반환 단계를 재현한다
        res += stack.pop()
    # res = 1+2+3+...+n
    return res


def tail_recur(n, res):
    """꼬리 재귀"""
    # 종료 조건
    if n == 0:
        return res
    # 꼬리 재귀 호출
    return tail_recur(n - 1, res + n)


def fib(n: int) -> int:
    """재귀로 피보나치 수 구하기"""
    # 종료 조건: f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # 재귀 호출: f(n) = f(n-1) + f(n-2)
    res = fib(n - 1) + fib(n - 2)
    # 결과 f(n)을 반환한다
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = recur(n)
    print(f"\n재귀 함수로 구한 합 res = {res}")

    res = for_loop_recur(n)
    print(f"\n반복으로 재귀를 구현해 구한 합 res = {res}")

    res = tail_recur(n, 0)
    print(f"\n꼬리 재귀 함수로 구한 합 res = {res}")

    res = fib(n)
    print(f"\n피보나치 수열의 {n}번째 항 = {res}")
