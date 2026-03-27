"""
File: min_path_sum.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""

from math import inf


def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
    """Минимальная сумма пути: полный перебор"""
    # Если это верхняя левая ячейка, завершить поиск
    if i == 0 and j == 0:
        return grid[0][0]
    # Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if i < 0 or j < 0:
        return inf
    # Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
    up = min_path_sum_dfs(grid, i - 1, j)
    left = min_path_sum_dfs(grid, i, j - 1)
    # Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    return min(left, up) + grid[i][j]


def min_path_sum_dfs_mem(
    grid: list[list[int]], mem: list[list[int]], i: int, j: int
) -> int:
    """Минимальная сумма пути: поиск с мемоизацией"""
    # Если это верхняя левая ячейка, завершить поиск
    if i == 0 and j == 0:
        return grid[0][0]
    # Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if i < 0 or j < 0:
        return inf
    # Если запись уже есть, вернуть сразу
    if mem[i][j] != -1:
        return mem[i][j]
    # Минимальная стоимость пути для левой и верхней ячеек
    up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
    left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
    # Сохранить и вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]


def min_path_sum_dp(grid: list[list[int]]) -> int:
    """Минимальная сумма пути: динамическое программирование"""
    n, m = len(grid), len(grid[0])
    # Инициализация таблицы dp
    dp = [[0] * m for _ in range(n)]
    dp[0][0] = grid[0][0]
    # Переход состояний: первая строка
    for j in range(1, m):
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    # Переход состояний: первый столбец
    for i in range(1, n):
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    # Переход состояний: остальные строки и столбцы
    for i in range(1, n):
        for j in range(1, m):
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
    return dp[n - 1][m - 1]


def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
    """Минимальная сумма пути: динамическое программирование с оптимизацией памяти"""
    n, m = len(grid), len(grid[0])
    # Инициализация таблицы dp
    dp = [0] * m
    # Переход состояний: первая строка
    dp[0] = grid[0][0]
    for j in range(1, m):
        dp[j] = dp[j - 1] + grid[0][j]
    # Переход состояний: остальные строки
    for i in range(1, n):
        # Переход состояний: первый столбец
        dp[0] = dp[0] + grid[i][0]
        # Переход состояний: остальные столбцы
        for j in range(1, m):
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
    return dp[m - 1]


"""Driver Code"""
if __name__ == "__main__":
    grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
    n, m = len(grid), len(grid[0])

    # Полный перебор
    res = min_path_sum_dfs(grid, n - 1, m - 1)
    print(f"Минимальная сумма пути из левого верхнего угла в правый нижний = {res}")

    # Поиск с мемоизацией
    mem = [[-1] * m for _ in range(n)]
    res = min_path_sum_dfs_mem(grid, mem, n - 1, m - 1)
    print(f"Минимальная сумма пути из левого верхнего угла в правый нижний = {res}")

    # Динамическое программирование
    res = min_path_sum_dp(grid)
    print(f"Минимальная сумма пути из левого верхнего угла в правый нижний = {res}")

    # Динамическое программирование с оптимизацией памяти
    res = min_path_sum_dp_comp(grid)
    print(f"Минимальная сумма пути из левого верхнего угла в правый нижний = {res}")
