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
    """백트래킹 알고리즘: n-퀸"""
    # 모든 행에 배치했으면 해를 기록한다
    if row == n:
        res.append([list(row) for row in state])
        return
    # 모든 열을 순회한다
    for col in range(n):
        # 해당 칸이 속한 주대각선과 부대각선을 계산한다
        diag1 = row - col + n - 1
        diag2 = row + col
        # 가지치기: 해당 칸이 속한 열, 주대각선, 부대각선에 퀸이 있으면 안 된다
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # 시도: 해당 칸에 퀸을 놓는다
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # 다음 행에 배치한다
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # 되돌리기: 해당 칸을 빈칸으로 되돌린다
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """n-퀸 문제 풀기"""
    # n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # 열에 퀸이 있는지 기록한다
    diags1 = [False] * (2 * n - 1)  # 주대각선에 퀸이 있는지 기록한다
    diags2 = [False] * (2 * n - 1)  # 부대각선에 퀸이 있는지 기록한다
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""실행 코드"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"입력한 체스판의 가로와 세로 길이: {n}")
    print(f"퀸을 배치하는 방법은 총 {len(res)}가지이다")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
