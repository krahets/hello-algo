"""
File: knapsack.py
Created Time: 2023-07-03
Author: krahets (krahets@163.com)
"""


def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
    """Рюкзак 0–1: полный перебор"""
    # Если предметы закончились или места не осталось, вернуть стоимость 0
    if i == 0 or c == 0:
        return 0
    # Если предмет тяжелее допустимого, остаётся только пропустить его
    if wgt[i - 1] > c:
        return knapsack_dfs(wgt, val, i - 1, c)
    # Вычислить максимальную стоимость без предмета i и с ним
    no = knapsack_dfs(wgt, val, i - 1, c)
    yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
    # Вернуть большую из двух стоимостей
    return max(no, yes)


def knapsack_dfs_mem(
    wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
) -> int:
    """Рюкзак 0–1: поиск с мемоизацией"""
    # Если предметы закончились или места не осталось, вернуть стоимость 0
    if i == 0 or c == 0:
        return 0
    # Если результат сохранён, сразу вернуть его
    if mem[i][c] != -1:
        return mem[i][c]
    # Если предмет тяжелее допустимого, остаётся только пропустить его
    if wgt[i - 1] > c:
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    # Вычислить максимальную стоимость без предмета i и с ним
    no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
    # Сохранить и вернуть большую из двух стоимостей
    mem[i][c] = max(no, yes)
    return mem[i][c]


def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """Рюкзак 0–1: динамическое программирование"""
    n = len(wgt)
    # Инициализировать таблицу dp
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # Переход между состояниями
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # Если предмет i тяжелее допустимого, пропустить его
                dp[i][c] = dp[i - 1][c]
            else:
                # Взять максимум из двух вариантов: без предмета i и с ним
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """Рюкзак 0–1: динамическое программирование с экономией памяти"""
    n = len(wgt)
    # Инициализировать таблицу dp
    dp = [0] * (cap + 1)
    # Переход между состояниями
    for i in range(1, n + 1):
        # Обход в обратном порядке
        for c in range(cap, 0, -1):
            if wgt[i - 1] > c:
                # Если предмет i тяжелее допустимого, пропустить его
                dp[c] = dp[c]
            else:
                # Взять максимум из двух вариантов: без предмета i и с ним
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
    print(f"Максимальная стоимость предметов, помещающихся в рюкзак: {res}")

    # Поиск с мемоизацией
    mem = [[-1] * (cap + 1) for _ in range(n + 1)]
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(f"Максимальная стоимость предметов, помещающихся в рюкзак: {res}")

    # Динамическое программирование
    res = knapsack_dp(wgt, val, cap)
    print(f"Максимальная стоимость предметов, помещающихся в рюкзак: {res}")

    # Динамическое программирование с экономией памяти
    res = knapsack_dp_comp(wgt, val, cap)
    print(f"Максимальная стоимость предметов, помещающихся в рюкзак: {res}")
