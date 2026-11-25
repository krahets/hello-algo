"""
File: fractional_knapsack.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""


class Item:
    """Предмет"""

    def __init__(self, w: int, v: int):
        self.w = w  # Вес предмета
        self.v = v  # Стоимость предмета


def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
    """Дробный рюкзак: жадный алгоритм"""
    # Создаём список предметов с двумя свойствами: весом и стоимостью
    items = [Item(w, v) for w, v in zip(wgt, val)]
    # Сортируем по убыванию удельной стоимости item.v / item.w
    items.sort(key=lambda item: item.v / item.w, reverse=True)
    # На каждом шаге делаем жадный выбор
    res = 0
    for item in items:
        if item.w <= cap:
            # Если места достаточно, кладём предмет целиком
            res += item.v
            cap -= item.w
        else:
            # Если места недостаточно, кладём часть предмета
            res += (item.v / item.w) * cap
            # Рюкзак заполнен, выходим из цикла
            break
    return res


"""Driver Code"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # Жадный алгоритм
    res = fractional_knapsack(wgt, val, cap)
    print(f"Максимальная стоимость при заданной вместимости рюкзака: {res}")
