"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """원판 하나를 옮긴다"""
    # src 맨 위의 원판 하나를 꺼낸다
    pan = src.pop()
    # 원판을 tar 맨 위에 놓는다
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """하노이의 탑 문제 f(i)를 푼다"""
    # src에 원판 하나만 남으면 바로 tar로 옮긴다
    if i == 1:
        move(src, tar)
        return
    # 부분 문제 f(i-1): tar를 보조 기둥으로 써서 src 위의 원판 i-1개를 buf로 옮긴다
    dfs(i - 1, src, tar, buf)
    # 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
    move(src, tar)
    # 부분 문제 f(i-1): src를 보조 기둥으로 써서 buf 위의 원판 i-1개를 tar로 옮긴다
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """하노이의 탑 문제 풀기"""
    n = len(A)
    # B를 보조 기둥으로 써서 A 위의 원판 n개를 C로 옮긴다
    dfs(n, A, B, C)


"""Driver Code"""
if __name__ == "__main__":
    # 리스트의 끝이 기둥의 맨 위에 해당한다
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("초기 상태:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("원판 이동 완료 후:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
