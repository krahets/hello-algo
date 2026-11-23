"""
File: climbing_stairs_dfs.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int) -> int:
    """탐색"""
    # dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if i == 1 or i == 2:
        return i
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1) + dfs(i - 2)
    return count


def climbing_stairs_dfs(n: int) -> int:
    """계단 오르기: 탐색"""
    return dfs(n)


"""실행 코드"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs(n)
    print(f"{n}개의 계단을 오르는 방법은 총 {res}가지이다")
