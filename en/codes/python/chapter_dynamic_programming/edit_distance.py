"""
File: edit_distancde.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""


def edit_distance_dfs(s: str, t: str, i: int, j: int) -> int:
    """Edit distance: Brute force search"""
    # If both s and t are empty, return 0
    if i == 0 and j == 0:
        return 0
    # If s is empty, return the length of t
    if i == 0:
        return j
    # If t is empty, return the length of s
    if j == 0:
        return i
    # If the two characters are equal, skip these two characters
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs(s, t, i - 1, j - 1)
    # The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    insert = edit_distance_dfs(s, t, i, j - 1)
    delete = edit_distance_dfs(s, t, i - 1, j)
    replace = edit_distance_dfs(s, t, i - 1, j - 1)
    # Return the minimum number of edits
    return min(insert, delete, replace) + 1


def edit_distance_dfs_mem(s: str, t: str, mem: list[list[int]], i: int, j: int) -> int:
    """Edit distance: Memoized search"""
    # If both s and t are empty, return 0
    if i == 0 and j == 0:
        return 0
    # If s is empty, return the length of t
    if i == 0:
        return j
    # If t is empty, return the length of s
    if j == 0:
        return i
    # If there is a record, return it
    if mem[i][j] != -1:
        return mem[i][j]
    # If the two characters are equal, skip these two characters
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
    delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
    replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # Record and return the minimum number of edits
    mem[i][j] = min(insert, delete, replace) + 1
    return mem[i][j]


def edit_distance_dp(s: str, t: str) -> int:
    """Edit distance: Dynamic programming"""
    n, m = len(s), len(t)
    dp = [[0] * (m + 1) for _ in range(n + 1)]
    # State transition: first row and first column
    for i in range(1, n + 1):
        dp[i][0] = i
    for j in range(1, m + 1):
        dp[0][j] = j
    # State transition: the rest of the rows and columns
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if s[i - 1] == t[j - 1]:
                # If the two characters are equal, skip these two characters
                dp[i][j] = dp[i - 1][j - 1]
            else:
                # The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
    return dp[n][m]


def edit_distance_dp_comp(s: str, t: str) -> int:
    """Edit distance: Space-optimized dynamic programming"""
    n, m = len(s), len(t)
    dp = [0] * (m + 1)
    # State transition: first row
    for j in range(1, m + 1):
        dp[j] = j
    # State transition: the rest of the rows
    for i in range(1, n + 1):
        # State transition: first column
        leftup = dp[0]  # Temporarily store dp[i-1, j-1]
        dp[0] += 1
        # State transition: the rest of the columns
        for j in range(1, m + 1):
            temp = dp[j]
            if s[i - 1] == t[j - 1]:
                # If the two characters are equal, skip these two characters
                dp[j] = leftup
            else:
                # The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                dp[j] = min(dp[j - 1], dp[j], leftup) + 1
            leftup = temp  # Update for the next round of dp[i-1, j-1]
    return dp[m]


"""Driver Code"""
if __name__ == "__main__":
    s = "bag"
    t = "pack"
    n, m = len(s), len(t)

    # Brute force search
    res = edit_distance_dfs(s, t, n, m)
    print(f"To change {s} to {t}, the minimum number of edits required is {res}")

    # Memoized search
    mem = [[-1] * (m + 1) for _ in range(n + 1)]
    res = edit_distance_dfs_mem(s, t, mem, n, m)
    print(f"To change {s} to {t}, the minimum number of edits required is {res}")

    # Dynamic programming
    res = edit_distance_dp(s, t)
    print(f"To change {s} to {t}, the minimum number of edits required is {res}")

    # Space-optimized dynamic programming
    res = edit_distance_dp_comp(s, t)
    print(f"To change {s} to {t}, the minimum number of edits required is {res}")
