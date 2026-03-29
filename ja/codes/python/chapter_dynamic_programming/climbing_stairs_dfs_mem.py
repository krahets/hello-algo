"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """メモ化探索"""
    # dp[1] と dp[2] は既知なので返す
    if i == 1 or i == 2:
        return i
    # dp[i] の記録があれば、それをそのまま返す
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # dp[i] を記録する
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """階段登り：メモ化探索"""
    # mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"{n} 段の階段を上る方法は全部で {res} 通りです")
