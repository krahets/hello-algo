"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """Подсчетная сортировка"""
    # Простая реализация, не может использоваться дляСортировкаобъект
    # 1. Найти максимальный элемент массива m
    m = max(nums)
    # 2. Подсчитать число появлений каждой цифры
    # counter[num] обозначает число появлений num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Обойти counter и записать элементы обратно в исходный массив nums
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """Подсчетная сортировка"""
    # Полная реализация, поддерживает сортируемые объекты и является стабильной сортировкой
    # 1. Найти максимальный элемент массива m
    m = max(nums)
    # 2. Подсчитать число появлений каждой цифры
    # counter[num] обозначает число появлений num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Вычислить префиксные суммы counter, преобразовав «число появлений» в «конечный индекс»
    # То есть counter[num]-1 — это индекс последнего появления num в res
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
    # Инициализировать массив res для хранения результата
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # Разместить num в соответствующем индексе
        counter[num] -= 1  # Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
    # Перезаписать исходный массив nums результатом из массива res
    for i in range(n):
        nums[i] = res[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"После завершения подсчетной сортировки (не подходит для сортируемых объектов) nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"После сортировки подсчетом nums1 = {nums1}")
