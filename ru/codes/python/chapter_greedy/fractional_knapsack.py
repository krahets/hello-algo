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
    # Создать список предметов с двумя свойствами: вес и стоимость
    items = [Item(w, v) for w, v in zip(wgt, val)]
    # Отсортировать по удельной стоимости item.v / item.w в порядке убывания
    items.sort(key=lambda item: item.v / item.w, reverse=True)
    # Циклический жадный выбор
    res = 0
    for item in items:
        if item.w <= cap:
            # Если оставшейся вместимости достаточно, положить в рюкзак текущий предмет целиком
            res += item.v
            cap -= item.w
        else:
            # Если оставшейся вместимости недостаточно, положить в рюкзак часть текущего предмета
            res += (item.v / item.w) * cap
            # Свободной вместимости больше не осталось, поэтому выйти из цикла
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
    print(f"Максимальная стоимость предметов без превышения вместимости рюкзака = {res}")
