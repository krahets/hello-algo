/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver Code */
    static func main() {
        // [region]{init_list}
        /* Инициализация списка */
        // Без начальных значений
        let emptyNums: [Int] = []
        // С начальными значениями
        var nums = [1, 3, 2, 5, 4]
        // [endregion]{init_list}
        print("Список nums = \(nums)")
        print("Список emptyNums = \(emptyNums)")

        // [region]{access_element}
        /* Доступ к элементу */
        let num = nums[1] // Доступ к элементу по индексу 1
        // [endregion]{access_element}
        print("Элемент по индексу 1: num = \(num)")

        // [region]{update_element}
        /* Изменение элемента */
        nums[1] = 0 // Изменить значение элемента с индексом 1 на 0
        // [endregion]{update_element}
        print("После изменения значения элемента с индексом 1 на 0 nums = \(nums)")

        // [region]{clear_list}
        /* Очистить список */
        nums.removeAll()
        // [endregion]{clear_list}
        print("После очистки списка nums = \(nums)")

        // [region]{append_element}
        /* Добавление элемента в конец */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        // [endregion]{append_element}
        print("После добавления элементов nums = \(nums)")

        // [region]{insert_element}
        /* Вставка элемента в середину */
        nums.insert(6, at: 3) // Вставить число 6 по индексу 3
        // [endregion]{insert_element}
        print("После вставки числа 6 по индексу 3 nums = \(nums)")

        // [region]{remove_element}
        /* Удаление элемента */
        nums.remove(at: 3) // Удалить элемент по индексу 3
        // [endregion]{remove_element}
        print("После удаления элемента по индексу 3 nums = \(nums)")

        // [region]{iterate_list}
        /* Обходить список по индексам */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }

        /* Непосредственно обходить элементы списка */
        count = 0
        for x in nums {
            count += x
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* Объединить два списка */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1) // Присоединить список nums1 к концу nums
        // [endregion]{concat_list}
        print("После конкатенации списка nums1 к nums nums = \(nums)")

        // [region]{sort_list}
        /* Отсортировать список */
        nums.sort() // После сортировки элементы списка идут по возрастанию
        // [endregion]{sort_list}
        print("После сортировки списка nums = \(nums)")
    }
}
