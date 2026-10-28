"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """메모이제이션을 이용한 탐색"""
    # dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if i == 1 or i == 2:
        return i
    # dp[i]의 기록이 있으면 해당 값을 바로 반환한다
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # dp[i]를 기록한다
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """계단 오르기: 메모이제이션을 이용한 탐색"""
    # mem[i]는 i번째 계단까지 오르는 전체 방법의 수를 기록하며, -1은 기록이 없음을 나타낸다
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""실행 코드"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"{n}개의 계단을 오르는 방법은 총 {res}가지이다")
