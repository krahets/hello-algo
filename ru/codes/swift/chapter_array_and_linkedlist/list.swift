/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver Code */
    static func main() {
        /* Инициализация списка */
        var nums = [1, 3, 2, 5, 4]
        print("Список nums = \(nums)")

        /* Доступ к элементу */
        let num = nums[1]
        print("Элемент по индексу 1: num = \(num)")

        /* Обновление элемента */
        nums[1] = 0
        print("После обновления элемента по индексу 1 до 0 nums = \(nums)")

        /* Очистить список */
        nums.removeAll()
        print("После очистки списка nums = \(nums)")

        /* Добавление элемента в конец */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("После добавления элементов nums = \(nums)")

        /* Вставка элемента в середину */
        nums.insert(6, at: 3)
        print("После вставки числа 6 по индексу 3 nums = \(nums)")

        /* Удаление элемента */
        nums.remove(at: 3)
        print("После удаления элемента по индексу 3 nums = \(nums)")

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

        /* Объединить два списка */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("После конкатенации списка nums1 к nums nums = \(nums)")

        /* Отсортировать список */
        nums.sort()
        print("После сортировки списка nums = \(nums)")
    }
}
