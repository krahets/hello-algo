"""
File: edit_distancde.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""


def edit_distance_dfs(s: str, t: str, i: int, j: int) -> int:
    """편집 거리: 완전 탐색"""
    # s와 t가 모두 비어 있으면 0을 반환한다
    if i == 0 and j == 0:
        return 0
    # s가 비어 있으면 t의 길이를 반환한다
    if i == 0:
        return j
    # t가 비어 있으면 s의 길이를 반환한다
    if j == 0:
        return i
    # 두 문자가 같으면 두 문자를 바로 건너뛴다
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs(s, t, i - 1, j - 1)
    # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
    insert = edit_distance_dfs(s, t, i, j - 1)
    delete = edit_distance_dfs(s, t, i - 1, j)
    replace = edit_distance_dfs(s, t, i - 1, j - 1)
    # 최소 편집 횟수를 반환한다
    return min(insert, delete, replace) + 1


def edit_distance_dfs_mem(s: str, t: str, mem: list[list[int]], i: int, j: int) -> int:
    """편집 거리: 메모이제이션을 이용한 탐색"""
    # s와 t가 모두 비어 있으면 0을 반환한다
    if i == 0 and j == 0:
        return 0
    # s가 비어 있으면 t의 길이를 반환한다
    if i == 0:
        return j
    # t가 비어 있으면 s의 길이를 반환한다
    if j == 0:
        return i
    # 기록이 이미 있으면 해당 값을 바로 반환한다
    if mem[i][j] != -1:
        return mem[i][j]
    # 두 문자가 같으면 두 문자를 바로 건너뛴다
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
    insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
    delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
    replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # 최소 편집 횟수를 기록하고 반환한다
    mem[i][j] = min(insert, delete, replace) + 1
    return mem[i][j]


def edit_distance_dp(s: str, t: str) -> int:
    """편집 거리: 동적 계획법"""
    n, m = len(s), len(t)
    dp = [[0] * (m + 1) for _ in range(n + 1)]
    # 상태 전이: 첫 번째 행과 첫 번째 열
    for i in range(1, n + 1):
        dp[i][0] = i
    for j in range(1, m + 1):
        dp[0][j] = j
    # 상태 전이: 나머지 행과 열
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if s[i - 1] == t[j - 1]:
                # 두 문자가 같으면 두 문자를 바로 건너뛴다
                dp[i][j] = dp[i - 1][j - 1]
            else:
                # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
    return dp[n][m]


def edit_distance_dp_comp(s: str, t: str) -> int:
    """편집 거리: 공간을 최적화한 동적 계획법"""
    n, m = len(s), len(t)
    dp = [0] * (m + 1)
    # 상태 전이: 첫 번째 행
    for j in range(1, m + 1):
        dp[j] = j
    # 상태 전이: 나머지 행
    for i in range(1, n + 1):
        # 상태 전이: 첫 번째 열
        leftup = dp[0]  # dp[i-1, j-1]을 임시로 저장한다
        dp[0] += 1
        # 상태 전이: 나머지 열
        for j in range(1, m + 1):
            temp = dp[j]
            if s[i - 1] == t[j - 1]:
                # 두 문자가 같으면 두 문자를 바로 건너뛴다
                dp[j] = leftup
            else:
                # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                dp[j] = min(dp[j - 1], dp[j], leftup) + 1
            leftup = temp  # 다음 반복의 dp[i-1, j-1]로 갱신한다
    return dp[m]


"""실행 코드"""
if __name__ == "__main__":
    s = "bag"
    t = "pack"
    n, m = len(s), len(t)

    # 완전 탐색
    res = edit_distance_dfs(s, t, n, m)
    print(f"{s} → {t} 변경에 필요한 최소 편집 횟수: {res}")

    # 메모이제이션을 이용한 탐색
    mem = [[-1] * (m + 1) for _ in range(n + 1)]
    res = edit_distance_dfs_mem(s, t, mem, n, m)
    print(f"{s} → {t} 변경에 필요한 최소 편집 횟수: {res}")

    # 동적 계획법
    res = edit_distance_dp(s, t)
    print(f"{s} → {t} 변경에 필요한 최소 편집 횟수: {res}")

    # 공간을 최적화한 동적 계획법
    res = edit_distance_dp_comp(s, t)
    print(f"{s} → {t} 변경에 필요한 최소 편집 횟수: {res}")
