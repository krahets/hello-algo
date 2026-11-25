"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """メモ化探索"""
    # 既知の値 dp[1] と dp[2] のうち、該当する方を返す
    if i == 1 or i == 2:
        return i
    # dp[i] が記録済みなら、その値を返す
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # dp[i] を記録する
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """階段の登り方：メモ化探索"""
    # mem[i] に i 段目までの登り方の総数を記録する。-1 は未記録を表す
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"全 {n} 段の階段の登り方は {res} 通り")
