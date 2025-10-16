"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """バックトラッキング"""
    # n 段目に登ったとき、解の数に 1 を加える
    if state == n:
        res[0] += 1
    # すべての選択肢を走査
    for choice in choices:
        # 枝刈り：n 段を超えて登ることを許可しない
        if state + choice > n:
            continue
        # 試行：選択を行い、状態を更新
        backtrack(choices, state + choice, n, res)
        # 撤回


def climbing_stairs_backtrack(n: int) -> int:
    """階段登り：バックトラッキング"""
    choices = [1, 2]  # 1 段または 2 段登ることを選択可能
    state = 0  # 0 段目から登り始める
    res = [0]  # res[0] を使用して解の数を記録
    backtrack(choices, state, n, res)
    return res[0]


"""ドライバーコード"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"{n} 段登り、合計 {res} 通りの解がある")