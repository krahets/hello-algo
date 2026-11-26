"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """回溯"""
    # 爬到第 n 階時，將走法數加 1
    if state == n:
        res[0] += 1
    # 走訪所有選項
    for choice in choices:
        # 剪枝：不能越過第 n 階
        if state + choice > n:
            continue
        # 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res)
        # 撤銷選擇


def climbing_stairs_backtrack(n: int) -> int:
    """爬樓梯：回溯法"""
    choices = [1, 2]  # 每次可以往上爬 1 階或 2 階
    state = 0  # 從第 0 階開始爬
    res = [0]  # 用 res[0] 記錄走法數
    backtrack(choices, state, n, res)
    return res[0]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"爬 {n} 階樓梯共有 {res} 種走法")
