"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """Memoized search"""
    # Return the known value for dp[1] or dp[2]
    if i == 1 or i == 2:
        return i
    # Return dp[i] directly if it is cached
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # Cache dp[i]
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """Climbing stairs with memoized search"""
    # mem[i] stores the number of ways to reach stair i. A value of -1 means no result is cached
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"Climbing {n} stairs: {res} ways")
