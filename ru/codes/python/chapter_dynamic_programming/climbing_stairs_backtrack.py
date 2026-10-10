"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """Бэктрекинг"""
    # Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
    if state == n:
        res[0] += 1
    # Перебор всех вариантов выбора
    for choice in choices:
        # Отсечение: нельзя выходить за n-ю ступень
        if state + choice > n:
            continue
        # Попытка: сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res)
        # Откат


def climbing_stairs_backtrack(n: int) -> int:
    """Подъем по лестнице: бэктрекинг"""
    choices = [1, 2]  # Можно подняться на 1 или 2 ступени
    state = 0  # Начать подъем с 0-й ступени
    res = [0]  # Использовать res[0] для хранения числа решений
    backtrack(choices, state, n, res)
    return res[0]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"Количество способов подняться по лестнице из {n} ступеней = {res}")
