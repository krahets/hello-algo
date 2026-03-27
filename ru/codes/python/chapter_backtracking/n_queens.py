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
    """Алгоритм бэктрекинга: n ферзей"""
    # Когда все строки заполнены, записать решение
    if row == n:
        res.append([list(row) for row in state])
        return
    # Обойти все столбцы
    for col in range(n):
        # Вычислить главную и побочную диагонали, соответствующие этой клетке
        diag1 = row - col + n - 1
        diag2 = row + col
        # Отсечение: не допускается наличие ферзя в этом столбце, на главной диагонали или на побочной диагонали
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # Попытка: разместить ферзя в этой клетке
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # Перейти к размещению следующей строки
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # Откат: восстановить эту клетку в пустое состояние
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """Решить задачу n ферзей"""
    # Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' обозначает пустую клетку
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # Записать, есть ли ферзь в столбце
    diags1 = [False] * (2 * n - 1)  # Записать, есть ли ферзь на главной диагонали
    diags2 = [False] * (2 * n - 1)  # Записать, есть ли ферзь на побочной диагонали
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"Входдоскаразмерравно {n}")
    print(f"Количество способов расстановки ферзей: {len(res)}")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
