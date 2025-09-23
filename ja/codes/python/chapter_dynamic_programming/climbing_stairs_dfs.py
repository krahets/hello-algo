"""
File: climbing_stairs_dfs.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int) -> int:
    """探索"""
    # 既知の dp[1] と dp[2] は、それらを返す
    if i == 1 or i == 2:
        return i
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1) + dfs(i - 2)
    return count


def climbing_stairs_dfs(n: int) -> int:
    """階段登り：探索"""
    return dfs(n)


"""ドライバーコード"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs(n)
    print(f"{n} 段登り、合計 {res} 通りの解がある")