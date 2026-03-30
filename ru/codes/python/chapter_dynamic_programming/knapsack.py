"""
File: knapsack.py
Created Time: 2023-07-03
Author: krahets (krahets@163.com)
"""


def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
    """Рюкзак 0-1: полный перебор"""
    # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
    if i == 0 or c == 0:
        return 0
    # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
    if wgt[i - 1] > c:
        return knapsack_dfs(wgt, val, i - 1, c)
    # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
    no = knapsack_dfs(wgt, val, i - 1, c)
    yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
    # Вернуть вариант с большей стоимостью из двух возможных
    return max(no, yes)


def knapsack_dfs_mem(
    wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
) -> int:
    """Рюкзак 0-1: поиск с мемоизацией"""
    # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
    if i == 0 or c == 0:
        return 0
    # Если запись уже есть, вернуть сразу
    if mem[i][c] != -1:
        return mem[i][c]
    # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
    if wgt[i - 1] > c:
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
    no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
    # Сохранить и вернуть вариант с большей стоимостью из двух решений
    mem[i][c] = max(no, yes)
    return mem[i][c]


def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """Рюкзак 0-1: динамическое программирование"""
    n = len(wgt)
    # Инициализация таблицы dp
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # Переход состояний
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # Если вместимость рюкзака превышена, предмет i не выбирать
                dp[i][c] = dp[i - 1][c]
            else:
                # Большее из двух решений: не брать или взять предмет i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """Рюкзак 0-1: динамическое программирование с оптимизацией памяти"""
    n = len(wgt)
    # Инициализация таблицы dp
    dp = [0] * (cap + 1)
    # Переход состояний
    for i in range(1, n + 1):
        # Обход в обратном порядке
        for c in range(cap, 0, -1):
            if wgt[i - 1] > c:
                # Если вместимость рюкзака превышена, предмет i не выбирать
                dp[c] = dp[c]
            else:
                # Большее из двух решений: не брать или взять предмет i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # Полный перебор
    res = knapsack_dfs(wgt, val, n, cap)
    print(f"Максимальная стоимость предметов без превышения вместимости рюкзака = {res}")

    # Поиск с мемоизацией
    mem = [[-1] * (cap + 1) for _ in range(n + 1)]
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(f"Максимальная стоимость предметов без превышения вместимости рюкзака = {res}")

    # Динамическое программирование
    res = knapsack_dp(wgt, val, cap)
    print(f"Максимальная стоимость предметов без превышения вместимости рюкзака = {res}")

    # Динамическое программирование с оптимизацией памяти
    res = knapsack_dp_comp(wgt, val, cap)
    print(f"Максимальная стоимость предметов без превышения вместимости рюкзака = {res}")
