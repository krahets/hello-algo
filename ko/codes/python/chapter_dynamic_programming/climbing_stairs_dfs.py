"""
File: climbing_stairs_dfs.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int) -> int:
    """탐색"""
    # 이미 아는 dp[1]과 dp[2]의 값 중 해당 값을 반환한다
    if i == 1 or i == 2:
        return i
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1) + dfs(i - 2)
    return count


def climbing_stairs_dfs(n: int) -> int:
    """계단 오르기: 탐색"""
    return dfs(n)


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs(n)
    print(f"계단 {n}개를 오르는 방법은 {res}가지")
