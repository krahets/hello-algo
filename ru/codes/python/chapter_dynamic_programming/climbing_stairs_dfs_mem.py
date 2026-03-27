"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """Поиск с мемоизацией"""
    # dp[1] и dp[2] уже известны, вернуть их
    if i == 1 or i == 2:
        return i
    # Если запись dp[i] существует, сразу вернуть ее
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # Сохранить dp[i]
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """Подъем по лестнице: поиск с мемоизацией"""
    # mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"Количество способов подняться по лестнице из {n} ступеней = {res}")
