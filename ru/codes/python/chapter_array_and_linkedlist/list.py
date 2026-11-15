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

    # [region]{access_element}
    # Доступ к элементу
    x: int = nums[1]  # Доступ к элементу по индексу 1
    # [endregion]{access_element}
    print("\nЭлемент по индексу 1: x =", x)

    # [region]{update_element}
    # Изменение элемента
    nums[1] = 0  # Изменить значение элемента с индексом 1 на 0
    # [endregion]{update_element}
    print("\nПосле изменения значения элемента с индексом 1 на 0 nums =", nums)

    # [region]{clear_list}
    # Очистить список
    nums.clear()
    # [endregion]{clear_list}
    print("\nПосле очистки списка nums =", nums)

    # [region]{append_element}
    # Добавление элемента в конец
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    # [endregion]{append_element}
    print("\nПосле добавления элементов nums =", nums)

    # [region]{insert_element}
    # Вставка элемента в середину
    nums.insert(3, 6)  # Вставить число 6 по индексу 3
    # [endregion]{insert_element}
    print("\nПосле вставки числа 6 по индексу 3 nums =", nums)

    # [region]{remove_element}
    # Удаление элемента
    nums.pop(3)  # Удалить элемент по индексу 3
    # [endregion]{remove_element}
    print("\nПосле удаления элемента по индексу 3 nums =", nums)

    # [region]{iterate_list}
    # Обходить список по индексам
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # Непосредственно обходить элементы списка
    for num in nums:
        count += num
    # [endregion]{iterate_list}

    # [region]{concat_list}
    # Объединить два списка
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1  # Присоединить список nums1 к концу nums
    # [endregion]{concat_list}
    print("\nПосле конкатенации списка nums1 к nums nums =", nums)

    # [region]{sort_list}
    # Отсортировать список
    nums.sort()  # После сортировки элементы списка идут по возрастанию
    # [endregion]{sort_list}
    print("\nПосле сортировки списка nums =", nums)
