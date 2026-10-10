"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """バックトラッキング"""
    # 第 n 段に到達したら、方法数を 1 増やす
    if state == n:
        res[0] += 1
    # すべての選択肢を走査
    for choice in choices:
        # 枝刈り: 第 n 段を超えないようにする
        if state + choice > n:
            continue
        # 試行: 選択を行い、状態を更新
        backtrack(choices, state + choice, n, res)
        # バックトラック


def climbing_stairs_backtrack(n: int) -> int:
    """階段登り：バックトラッキング"""
    choices = [1, 2]  # 1 段または 2 段上ることを選べる
    state = 0  # 第 0 段から上り始める
    res = [0]  # res[0] を使って方法数を記録する
    backtrack(choices, state, n, res)
    return res[0]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"{n} 段の階段を上る方法は全部で {res} 通りです")
