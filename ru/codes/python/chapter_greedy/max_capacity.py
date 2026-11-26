"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """Максимальная вместимость: жадный алгоритм"""
    # Ставим i и j на противоположные концы массива
    i, j = 0, len(ht) - 1
    # Изначально максимальная вместимость равна 0
    res = 0
    # Повторяем жадный выбор, пока перегородки не встретятся
    while i < j:
        # Обновляем максимальную вместимость
        cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        # Сдвигаем указатель у более низкой перегородки к центру
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
    print(f"Максимальная вместимость: {res}")
