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
    """Поиск с возвратом: задача о n ферзях"""
    # Когда ферзи расставлены во всех строках, сохраняем решение
    if row == n:
        res.append([list(row) for row in state])
        return
    # Перебираем все столбцы
    for col in range(n):
        # Вычисляем индексы прямой и обратной диагоналей клетки
        diag1 = row - col + n - 1
        diag2 = row + col
        # Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # Пробуем поставить ферзя на эту клетку
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # Переходим к следующей строке
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # Возврат: освобождаем клетку
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """Решение задачи о n ферзях"""
    # Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # Отмечаем столбцы, занятые ферзями
    diags1 = [False] * (2 * n - 1)  # Отмечаем прямые диагонали, занятые ферзями
    diags2 = [False] * (2 * n - 1)  # Отмечаем обратные диагонали, занятые ферзями
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"Длина стороны доски: {n}")
    print(f"Число расстановок ферзей: {len(res)}.")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
