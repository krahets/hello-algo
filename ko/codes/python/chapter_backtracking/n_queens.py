"""
File: n_queens.py
Created Time: 2023-04-26
Author: krahets (krahets@163.com)
"""


def backtrack(
    row: int,
    n: int,
    state: list[list[str]],
    res: list[list[list[str]]],
    cols: list[bool],
    diags1: list[bool],
    diags2: list[bool],
):
    """백트래킹: n-퀸"""
    # 모든 행에 퀸을 놓으면 해를 기록한다
    if row == n:
        res.append([list(row) for row in state])
        return
    # 모든 열을 순회한다
    for col in range(n):
        # 이 칸이 속한 주대각선과 부대각선의 번호를 구한다
        diag1 = row - col + n - 1
        diag2 = row + col
        # 가지치기: 이 칸과 같은 열, 주대각선, 부대각선에 퀸이 있으면 건너뛴다
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # 시도: 이 칸에 퀸을 놓는다
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # 다음 행에 퀸을 놓는다
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # 되돌리기: 이 칸을 다시 비운다
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """n-퀸 문제 풀기"""
    # n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸이다
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # 각 열에 퀸이 있는지 기록한다
    diags1 = [False] * (2 * n - 1)  # 각 주대각선에 퀸이 있는지 기록한다
    diags2 = [False] * (2 * n - 1)  # 각 부대각선에 퀸이 있는지 기록한다
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"입력 체스판의 한 변의 길이: {n}")
    print(f"퀸 배치 방법은 총 {len(res)}가지")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
