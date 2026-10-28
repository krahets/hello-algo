"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """백트래킹"""
    # n번째 계단에 도달하면 방법의 수에 1을 더한다
    if state == n:
        res[0] += 1
    # 모든 선택지를 순회한다
    for choice in choices:
        # 가지치기: n번째 계단을 넘어갈 수 없다
        if state + choice > n:
            continue
        # 시도: 선택하고 상태를 갱신한다
        backtrack(choices, state + choice, n, res)
        # 되돌리기


def climbing_stairs_backtrack(n: int) -> int:
    """계단 오르기: 백트래킹"""
    choices = [1, 2]  # 한 계단 또는 두 계단 오르기를 선택할 수 있다
    state = 0  # 0번째 계단에서 오르기 시작한다
    res = [0]  # res[0]에 방법의 수를 기록한다
    backtrack(choices, state, n, res)
    return res[0]


"""실행 코드"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"{n}개의 계단을 오르는 방법은 총 {res}가지이다")
