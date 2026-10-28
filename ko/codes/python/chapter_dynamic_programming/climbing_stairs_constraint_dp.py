"""
File: climbing_stairs_constraint_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_constraint_dp(n: int) -> int:
    """제약 조건이 있는 계단 오르기: 동적 계획법"""
    if n == 1 or n == 2:
        return 1
    # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    dp = [[0] * 3 for _ in range(n + 1)]
    # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1][1], dp[1][2] = 1, 0
    dp[2][1], dp[2][2] = 0, 1
    # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for i in range(3, n + 1):
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    return dp[n][1] + dp[n][2]


"""실행 코드"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_constraint_dp(n)
    print(f"{n}개의 계단을 오르는 방법은 총 {res}가지이다")
