"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """Объединить левый и правый подмассивы"""
    # Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
    # Создать временный массив tmp для хранения результата слияния
    tmp = [0] * (right - left + 1)
    # Инициализировать начальные индексы левого и правого подмассивов
    i, j, k = left, mid + 1, 0
    # Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
    while i <= mid and j <= right:
        if nums[i] <= nums[j]:
            tmp[k] = nums[i]
            i += 1
        else:
            tmp[k] = nums[j]
            j += 1
        k += 1
    # Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
    while i <= mid:
        tmp[k] = nums[i]
        i += 1
        k += 1
    while j <= right:
        tmp[k] = nums[j]
        j += 1
        k += 1
    # Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """Сортировка слиянием"""
    # Условие завершения
    if left >= right:
        return  # Завершить рекурсию, когда длина подмассива равна 1
    # Этап разбиения
    mid = (left + right) // 2 # Вычислить середину
    merge_sort(nums, left, mid)  # Рекурсивно обработать левый подмассив
    merge_sort(nums, mid + 1, right)  # Рекурсивно обработать правый подмассив
    # Этап слияния
    merge(nums, left, mid, right)


"""Driver Code"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("После сортировки слиянием nums =", nums)
