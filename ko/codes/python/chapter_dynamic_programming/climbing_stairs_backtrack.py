"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """백트래킹"""
    # n번째 계단에 도달하면 방법 수를 1 늘린다
    if state == n:
        res[0] += 1
    # 모든 선택지 순회
    for choice in choices:
        # 가지치기: n번째 계단을 넘지 않는다
        if state + choice > n:
            continue
        # 시도: 선택한 뒤 상태를 갱신한다
        backtrack(choices, state + choice, n, res)
        # 선택 취소


def climbing_stairs_backtrack(n: int) -> int:
    """계단 오르기: 백트래킹"""
    choices = [1, 2]  # 한 번에 한 계단 또는 두 계단을 오른다
    state = 0  # 0번째 계단에서 출발한다
    res = [0]  # res[0]에 방법 수를 기록한다
    backtrack(choices, state, n, res)
    return res[0]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"계단 {n}개를 오르는 방법은 {res}가지")
