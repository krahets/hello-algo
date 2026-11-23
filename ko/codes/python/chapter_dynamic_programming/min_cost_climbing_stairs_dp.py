"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """계단 오르기의 최소 비용: 동적 계획법"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    dp = [0] * (n + 1)
    # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1], dp[2] = cost[1], cost[2]
    # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    a, b = cost[1], cost[2]
    for i in range(3, n + 1):
        a, b = b, min(a, b) + cost[i]
    return b


"""실행 코드"""
if __name__ == "__main__":
    cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
    print(f"입력한 계단의 비용 리스트는 {cost}이다")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"계단을 모두 오르는 최소 비용은 {res}이다")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"계단을 모두 오르는 최소 비용은 {res}이다")
