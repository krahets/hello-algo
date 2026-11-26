"""
File: climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_dp(n: int) -> int:
    """계단 오르기: 동적 계획법"""
    if n == 1 or n == 2:
        return n
    # 부분 문제의 해를 저장할 dp 테이블 초기화
    dp = [0] * (n + 1)
    # 초기 상태: 가장 작은 부분 문제의 해를 설정한다
    dp[1], dp[2] = 1, 2
    # 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
    for i in range(3, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]


def climbing_stairs_dp_comp(n: int) -> int:
    """계단 오르기: 공간 최적화 동적 계획법"""
    if n == 1 or n == 2:
        return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dp(n)
    print(f"계단 {n}개를 오르는 방법은 {res}가지")

    res = climbing_stairs_dp_comp(n)
    print(f"계단 {n}개를 오르는 방법은 {res}가지")
