"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """원판 하나 이동"""
    # src의 맨 위에서 원판 하나를 꺼낸다
    pan = src.pop()
    # 원판을 tar의 맨 위에 놓는다
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """하노이의 탑 문제 f(i) 풀기"""
    # src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
    if i == 1:
        move(src, tar)
        return
    # 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
    dfs(i - 1, src, tar, buf)
    # 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
    move(src, tar)
    # 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """하노이의 탑 문제 풀기"""
    n = len(A)
    # B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
    dfs(n, A, B, C)


"""실행 코드"""
if __name__ == "__main__":
    # 리스트의 맨 뒤가 기둥의 맨 위이다
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("초기 상태:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("원판 이동을 마친 후:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
