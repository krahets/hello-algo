"""
File: bucket_sort.py
Created Time: 2023-03-30
Author: krahets (krahets@163.com)
"""


def bucket_sort(nums: list[float]):
    """Блочная сортировка"""
    # Создать k = n/2 блоков в расчёте на два элемента в каждом
    k = len(nums) // 2
    buckets = [[] for _ in range(k)]
    # 1. Распределить элементы массива по блокам
    for num in nums:
        # Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
        i = int(num * k)
        # Добавить num в блок i
        buckets[i].append(num)
    # 2. Отсортировать каждый блок
    for bucket in buckets:
        # Используем встроенную сортировку. Её можно заменить другим алгоритмом
        bucket.sort()
    # 3. Обойти блоки и объединить результаты
    i = 0
    for bucket in buckets:
        for num in bucket:
            nums[i] = num
            i += 1


if __name__ == "__main__":
    # Входные данные — числа с плавающей точкой из интервала [0, 1)
    nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
    bucket_sort(nums)
    print("После блочной сортировки nums =", nums)
