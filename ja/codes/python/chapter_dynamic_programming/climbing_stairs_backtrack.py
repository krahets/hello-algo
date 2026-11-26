"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """バックトラック"""
    # n 段目に着いたら、登り方の数を 1 増やす
    if state == n:
        res[0] += 1
    # すべての選択肢を調べる
    for choice in choices:
        # 枝刈り：n 段目を越えないようにする
        if state + choice > n:
            continue
        # 選択肢を試し、状態を更新する
        backtrack(choices, state + choice, n, res)
        # 選択を取り消す


def climbing_stairs_backtrack(n: int) -> int:
    """階段の登り方：バックトラック"""
    choices = [1, 2]  # 1 段または 2 段登れる
    state = 0  # 0 段目から登り始める
    res = [0]  # res[0] に登り方の数を記録する
    backtrack(choices, state, n, res)
    return res[0]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"全 {n} 段の階段の登り方は {res} 通り")
