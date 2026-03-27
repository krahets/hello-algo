/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver Code */
    static func main() {
        /* Инициализировать список */
        var nums = [1, 3, 2, 5, 4]
        print("Список nums = \(nums)")

        /* Получить доступ к элементу */
        let num = nums[1]
        print("обратиться киндекс 1 поэлемент, получаем num = \(num)")

        /* Обновить элемент */
        nums[1] = 0
        print("После обновления элемента по индексу 1 на 0 получаем nums = \(nums)")

        /* Очистить список */
        nums.removeAll()
        print("После очистки списка nums = \(nums)")

        /* Добавить элемент в конец */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("Добавитьэлементпосле nums = \(nums)")

        /* Вставить элемент в середину */
        nums.insert(6, at: 3)
        print("После вставки числа 6 по индексу 3 получаем nums = \(nums)")

        /* Удалить элемент */
        nums.remove(at: 3)
        print("Удалитьиндекс 3 поэлемент, получаем nums = \(nums)")

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
        print("После присоединения списка nums1 к nums получаем nums = \(nums)")

        /* Отсортировать список */
        nums.sort()
        print("После сортировки списка nums = \(nums)")
    }
}
