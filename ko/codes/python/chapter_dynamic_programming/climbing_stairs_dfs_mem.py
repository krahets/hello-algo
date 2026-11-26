"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """메모이제이션 탐색"""
    # 이미 아는 dp[1]과 dp[2]의 값 중 해당 값을 반환한다
    if i == 1 or i == 2:
        return i
    # dp[i]의 기록이 있으면 바로 반환한다
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # dp[i] 기록
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """계단 오르기: 메모이제이션 탐색"""
    # mem[i]에 i번째 계단까지 오르는 방법 수를 기록한다. -1은 기록이 없음을 뜻한다
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"계단 {n}개를 오르는 방법은 {res}가지")
