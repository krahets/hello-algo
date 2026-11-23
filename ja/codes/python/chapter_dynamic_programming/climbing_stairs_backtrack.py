"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """バックトラッキング"""
    # n 段目に到達したら、方法の数を 1 増やす
    if state == n:
        res[0] += 1
    # すべての選択肢を走査する
    for choice in choices:
        # 枝刈り：n 段目を越えてはならない
        if state + choice > n:
            continue
        # 試行：選択を行い、状態を更新する
        backtrack(choices, state + choice, n, res)
        # 復元


def climbing_stairs_backtrack(n: int) -> int:
    """階段の上り方：バックトラッキング"""
    choices = [1, 2]  # 1 段または 2 段上ることを選択できる
    state = 0  # 0 段目から上り始める
    res = [0]  # res[0] に方法の数を記録する
    backtrack(choices, state, n, res)
    return res[0]


"""実行用コード"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"{n} 段の階段を上る方法は全部で {res} 通り")
