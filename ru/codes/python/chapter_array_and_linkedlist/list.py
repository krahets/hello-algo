"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать список
    nums: list[int] = [1, 3, 2, 5, 4]
    print("\nСписок nums =", nums)

    # Получить доступ к элементу
    x: int = nums[1]
    print("\nПосле доступа к элементу по индексу 1 получаем x =", x)

    # Обновить элемент
    nums[1] = 0
    print("\nПосле обновления элемента по индексу 1 до 0 получаем nums =", nums)

    # Очистить список
    nums.clear()
    print("\nПосле очистки списка nums =", nums)

    # Добавить элемент в конец
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    print("\nПосле добавления элемента nums =", nums)

    # Вставить элемент в середину
    nums.insert(3, 6)
    print("\nПосле вставки числа 6 в индекс 3 получаем nums =", nums)

    # Удалить элемент
    nums.pop(3)
    print("\nПосле удаления элемента по индексу 3 получаем nums =", nums)

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
    print("\nПосле присоединения списка nums1 к nums получаем nums =", nums)

    # Отсортировать список
    nums.sort()
    print("\nПосле сортировки списка nums =", nums)
