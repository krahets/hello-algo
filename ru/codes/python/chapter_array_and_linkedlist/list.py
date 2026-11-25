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

    # Изменение элемента
    nums[1] = 0
    print("\nПосле записи 0 по индексу 1 nums =", nums)

    # Очистка списка
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

    # Обойти список по индексам
    count = 0
    for i in range(len(nums)):
        count += nums[i]
    # Перебрать элементы списка напрямую
    for num in nums:
        count += num

    # Объединение двух списков
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    print("\nПосле добавления nums1 в конец nums получаем nums =", nums)

    # Сортировка списка
    nums.sort()
    print("\nПосле сортировки nums =", nums)
