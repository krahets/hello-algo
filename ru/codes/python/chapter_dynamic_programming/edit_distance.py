"""
File: edit_distancde.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""


def edit_distance_dfs(s: str, t: str, i: int, j: int) -> int:
    """Редакционное расстояние: полный перебор"""
    # Если s и t пусты, вернуть 0
    if i == 0 and j == 0:
        return 0
    # Если s пусто, вернуть длину t
    if i == 0:
        return j
    # Если t пусто, вернуть длину s
    if j == 0:
        return i
    # Если два символа равны, сразу пропустить их
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs(s, t, i - 1, j - 1)
    # Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
    insert = edit_distance_dfs(s, t, i, j - 1)
    delete = edit_distance_dfs(s, t, i - 1, j)
    replace = edit_distance_dfs(s, t, i - 1, j - 1)
    # Вернуть минимальное число шагов редактирования
    return min(insert, delete, replace) + 1


def edit_distance_dfs_mem(s: str, t: str, mem: list[list[int]], i: int, j: int) -> int:
    """Редакционное расстояние: поиск с мемоизацией"""
    # Если s и t пусты, вернуть 0
    if i == 0 and j == 0:
        return 0
    # Если s пусто, вернуть длину t
    if i == 0:
        return j
    # Если t пусто, вернуть длину s
    if j == 0:
        return i
    # Если запись уже есть, сразу вернуть ее
    if mem[i][j] != -1:
        return mem[i][j]
    # Если два символа равны, сразу пропустить их
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
    insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
    delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
    replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # Сохранить и вернуть минимальное число шагов редактирования
    mem[i][j] = min(insert, delete, replace) + 1
    return mem[i][j]


def edit_distance_dp(s: str, t: str) -> int:
    """Редакционное расстояние: динамическое программирование"""
    n, m = len(s), len(t)
    dp = [[0] * (m + 1) for _ in range(n + 1)]
    # Переход состояний: первая строка и первый столбец
    for i in range(1, n + 1):
        dp[i][0] = i
    for j in range(1, m + 1):
        dp[0][j] = j
    # Переход состояний: остальные строки и столбцы
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if s[i - 1] == t[j - 1]:
                # Если два символа равны, сразу пропустить их
                dp[i][j] = dp[i - 1][j - 1]
            else:
                # Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
    return dp[n][m]


def edit_distance_dp_comp(s: str, t: str) -> int:
    """Редакционное расстояние: динамическое программирование с оптимизацией памяти"""
    n, m = len(s), len(t)
    dp = [0] * (m + 1)
    # Переход состояний: первая строка
    for j in range(1, m + 1):
        dp[j] = j
    # Переход состояний: остальные строки
    for i in range(1, n + 1):
        # Переход состояний: первый столбец
        leftup = dp[0]  # Временно сохранить dp[i-1, j-1]
        dp[0] += 1
        # Переход состояний: остальные столбцы
        for j in range(1, m + 1):
            temp = dp[j]
            if s[i - 1] == t[j - 1]:
                # Если два символа равны, сразу пропустить их
                dp[j] = leftup
            else:
                # Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
                dp[j] = min(dp[j - 1], dp[j], leftup) + 1
            leftup = temp  # Обновить до значения dp[i-1, j-1] для следующей итерации
    return dp[m]


"""Driver Code"""
if __name__ == "__main__":
    s = "bag"
    t = "pack"
    n, m = len(s), len(t)

    # Полный перебор
    res = edit_distance_dfs(s, t, n, m)
    print(f"Чтобы преобразовать {s} в {t}, нужно минимум {res} шагов")

    # Поиск с мемоизацией
    mem = [[-1] * (m + 1) for _ in range(n + 1)]
    res = edit_distance_dfs_mem(s, t, mem, n, m)
    print(f"Чтобы преобразовать {s} в {t}, нужно минимум {res} шагов")

    # Динамическое программирование
    res = edit_distance_dp(s, t)
    print(f"Чтобы преобразовать {s} в {t}, нужно минимум {res} шагов")

    # Динамическое программирование с оптимизацией памяти
    res = edit_distance_dp_comp(s, t)
    print(f"Чтобы преобразовать {s} в {t}, нужно минимум {res} шагов")
