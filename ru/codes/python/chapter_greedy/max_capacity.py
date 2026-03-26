"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """Максимальная вместимость: жадный алгоритм"""
    # Инициализировать i и j так, чтобы они располагались на двух концах массива
    i, j = 0, len(ht) - 1
    # Начальная максимальная вместимость равна 0
    res = 0
    # Повторять жадный выбор, пока две доски не встретятся
    while i < j:
        # Обновить максимальную вместимость
        cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        # Сдвинуть внутрь более короткую сторону
        if ht[i] < ht[j]:
            i += 1
        else:
            j -= 1
    return res


"""Driver Code"""
if __name__ == "__main__":
    ht = [3, 8, 5, 2, 7, 7, 3, 4]

    # Жадный алгоритм
    res = max_capacity(ht)
    print(f"максимальныйвместимостьравно {res}")
