"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """Слить левый и правый подмассивы"""
    # Левый подмассив занимает [left, mid], правый — [mid+1, right]
    # Создать временный массив tmp для результата слияния
    tmp = [0] * (right - left + 1)
    # Установить индексы на начало левого и правого подмассивов
    i, j, k = left, mid + 1, 0
    # Пока в обоих подмассивах есть элементы, сравнивать их и копировать меньший во временный массив
    while i <= mid and j <= right:
        if nums[i] <= nums[j]:
            tmp[k] = nums[i]
            i += 1
        else:
            tmp[k] = nums[j]
            j += 1
        k += 1
    # Скопировать оставшиеся элементы подмассивов во временный массив
    while i <= mid:
        tmp[k] = nums[i]
        i += 1
        k += 1
    while j <= right:
        tmp[k] = nums[j]
        j += 1
        k += 1
    # Скопировать элементы tmp обратно на соответствующий участок nums
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """Сортировка слиянием"""
    # Условие остановки
    if left >= right:
        return  # Завершить рекурсию, когда длина подмассива равна 1
    # Разбиение
    mid = (left + right) // 2 # Вычислить середину
    merge_sort(nums, left, mid)  # Рекурсивно отсортировать левый подмассив
    merge_sort(nums, mid + 1, right)  # Рекурсивно отсортировать правый подмассив
    # Слияние
    merge(nums, left, mid, right)


"""Driver Code"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("После сортировки слиянием nums =", nums)
