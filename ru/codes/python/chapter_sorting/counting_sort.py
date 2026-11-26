"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """Сортировка подсчётом"""
    # Простая реализация, непригодная для сортировки объектов
    # 1. Найти максимальный элемент m в массиве
    m = max(nums)
    # 2. Подсчитать число вхождений каждого значения
    # counter[num] — число вхождений num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Пройти по counter и записать элементы в исходный массив nums
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """Сортировка подсчётом"""
    # Полная реализация: устойчивая сортировка с поддержкой объектов
    # 1. Найти максимальный элемент m в массиве
    m = max(nums)
    # 2. Подсчитать число вхождений каждого значения
    # counter[num] — число вхождений num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
    # То есть counter[num]-1 — индекс последнего вхождения num в res
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
    # Создать массив res для результата
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # Поместить num по соответствующему индексу
        counter[num] -= 1  # Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
    # Скопировать результат из res в исходный массив nums
    for i in range(n):
        nums[i] = res[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"После сортировки подсчётом (без поддержки объектов) nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"После сортировки подсчётом nums1 = {nums1}")
