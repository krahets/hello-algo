"""
File: climbing_stairs_dfs.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int) -> int:
    """Search"""
    # Known dp[1] and dp[2], return them
    if i == 1 or i == 2:
        return i
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1) + dfs(i - 2)
    return count


def climbing_stairs_dfs(n: int) -> int:
    """Climbing stairs: Search"""
    return dfs(n)


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs(n)
    print(f"Climb {n} steps, there are {res} solutions in total")
