"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # Инициализация списка
    nums: list[int] = [1, 3, 2, 5, 4]
    print("\nСписок nums =", nums)

    # Доступ к элементу
    x: int = nums[1]
    print("\nЭлемент по индексу 1: x =", x)

    # Обновление элемента
    nums[1] = 0
    print("\nПосле обновления элемента по индексу 1 до 0 nums =", nums)

    # Очистить список
    nums.clear()
    print("\nПосле очистки списка nums =", nums)

    # Добавление элемента в конец
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    print("\nПосле добавления элементов nums =", nums)

    # Вставка элемента в середину
    nums.insert(3, 6)
    print("\nПосле вставки числа 6 по индексу 3 nums =", nums)

    # Удаление элемента
    nums.pop(3)
    print("\nПосле удаления элемента по индексу 3 nums =", nums)

    # Обходить список по индексам
    count = 0
    for i in range(len(nums)):
        count += nums[i]
    # Непосредственно обходить элементы списка
    for num in nums:
        count += num

    # Объединить два списка
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    print("\nПосле конкатенации списка nums1 к nums nums =", nums)

    # Отсортировать список
    nums.sort()
    print("\nПосле сортировки списка nums =", nums)
