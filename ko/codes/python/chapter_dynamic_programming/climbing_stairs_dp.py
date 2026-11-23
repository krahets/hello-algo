"""
File: climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_dp(n: int) -> int:
    """계단 오르기: 동적 계획법"""
    if n == 1 or n == 2:
        return n
    # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    dp = [0] * (n + 1)
    # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1], dp[2] = 1, 2
    # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for i in range(3, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]


def climbing_stairs_dp_comp(n: int) -> int:
    """계단 오르기: 공간을 최적화한 동적 계획법"""
    if n == 1 or n == 2:
        return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b


"""실행 코드"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dp(n)
    print(f"{n}개의 계단을 오르는 방법은 총 {res}가지이다")

    res = climbing_stairs_dp_comp(n)
    print(f"{n}개의 계단을 오르는 방법은 총 {res}가지이다")
