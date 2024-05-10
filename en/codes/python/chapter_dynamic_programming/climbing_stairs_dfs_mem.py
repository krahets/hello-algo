"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """Memoized search"""
    # Known dp[1] and dp[2], return them
    if i == 1 or i == 2:
        return i
    # If there is a record for dp[i], return it
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # Record dp[i]
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """Climbing stairs: Memoized search"""
    # mem[i] records the total number of solutions for climbing to the ith step, -1 means no record
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"Climb {n} steps, there are {res} solutions in total")
