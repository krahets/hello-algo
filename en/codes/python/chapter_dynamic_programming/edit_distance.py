"""
File: edit_distancde.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""


def edit_distance_dfs(s: str, t: str, i: int, j: int) -> int:
    """Edit distance with brute-force search"""
    # Return 0 if both s and t are empty
    if i == 0 and j == 0:
        return 0
    # Return the length of t if s is empty
    if i == 0:
        return j
    # Return the length of s if t is empty
    if j == 0:
        return i
    # Skip both characters if they match
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs(s, t, i - 1, j - 1)
    # Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    insert = edit_distance_dfs(s, t, i, j - 1)
    delete = edit_distance_dfs(s, t, i - 1, j)
    replace = edit_distance_dfs(s, t, i - 1, j - 1)
    # Return the minimum number of edits
    return min(insert, delete, replace) + 1


def edit_distance_dfs_mem(s: str, t: str, mem: list[list[int]], i: int, j: int) -> int:
    """Edit distance with memoized search"""
    # Return 0 if both s and t are empty
    if i == 0 and j == 0:
        return 0
    # Return the length of t if s is empty
    if i == 0:
        return j
    # Return the length of s if t is empty
    if j == 0:
        return i
    # Return the cached result if available
    if mem[i][j] != -1:
        return mem[i][j]
    # Skip both characters if they match
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
    delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
    replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # Cache and return the minimum number of edits
    mem[i][j] = min(insert, delete, replace) + 1
    return mem[i][j]


def edit_distance_dp(s: str, t: str) -> int:
    """Edit distance with dynamic programming"""
    n, m = len(s), len(t)
    dp = [[0] * (m + 1) for _ in range(n + 1)]
    # State transitions for the first row and column
    for i in range(1, n + 1):
        dp[i][0] = i
    for j in range(1, m + 1):
        dp[0][j] = j
    # State transitions for the remaining rows and columns
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if s[i - 1] == t[j - 1]:
                # Skip both characters if they match
                dp[i][j] = dp[i - 1][j - 1]
            else:
                # Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
    return dp[n][m]


def edit_distance_dp_comp(s: str, t: str) -> int:
    """Edit distance with space-optimized dynamic programming"""
    n, m = len(s), len(t)
    dp = [0] * (m + 1)
    # State transitions for the first row
    for j in range(1, m + 1):
        dp[j] = j
    # State transitions for the remaining rows
    for i in range(1, n + 1):
        # State transitions for the first column
        leftup = dp[0]  # Save dp[i-1, j-1] temporarily
        dp[0] += 1
        # State transitions for the remaining columns
        for j in range(1, m + 1):
            temp = dp[j]
            if s[i - 1] == t[j - 1]:
                # Skip both characters if they match
                dp[j] = leftup
            else:
                # Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
                dp[j] = min(dp[j - 1], dp[j], leftup) + 1
            leftup = temp  # Update the saved value to hold dp[i-1, j-1] for the next iteration
    return dp[m]


"""Driver Code"""
if __name__ == "__main__":
    s = "bag"
    t = "pack"
    n, m = len(s), len(t)

    # Brute-force search
    res = edit_distance_dfs(s, t, n, m)
    print(f"Changing {s} to {t} requires at least {res} edits")

    # Memoized search
    mem = [[-1] * (m + 1) for _ in range(n + 1)]
    res = edit_distance_dfs_mem(s, t, mem, n, m)
    print(f"Changing {s} to {t} requires at least {res} edits")

    # Dynamic programming
    res = edit_distance_dp(s, t)
    print(f"Changing {s} to {t} requires at least {res} edits")

    # Space-optimized dynamic programming
    res = edit_distance_dp_comp(s, t)
    print(f"Changing {s} to {t} requires at least {res} edits")
