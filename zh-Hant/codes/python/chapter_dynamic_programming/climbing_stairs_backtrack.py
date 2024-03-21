"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """回溯"""
    # 當爬到第 n 階時，方案數量加 1
    if state == n:
        res[0] += 1
    # 走訪所有選擇
    for choice in choices:
        # 剪枝：不允許越過第 n 階
        if state + choice > n:
            continue
        # 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res)
        # 回退


def climbing_stairs_backtrack(n: int) -> int:
    """爬樓梯：回溯"""
    choices = [1, 2]  # 可選擇向上爬 1 階或 2 階
    state = 0  # 從第 0 階開始爬
    res = [0]  # 使用 res[0] 記錄方案數量
    backtrack(choices, state, n, res)
    return res[0]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"爬 {n} 階樓梯共有 {res} 種方案")
