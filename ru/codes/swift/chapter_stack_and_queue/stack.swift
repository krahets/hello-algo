/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver Code */
    static func main() {
        // [region]{init_stack}
        /* Инициализация стека */
        // В Swift нет встроенного класса стека, поэтому Array можно использовать как стек
        var stack: [Int] = []
        // [endregion]{init_stack}

        // [region]{push}
        /* Помещение элемента в стек */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        // [endregion]{push}
        print("Стек stack = \(stack)")

        // [region]{peek}
        /* Доступ к верхнему элементу стека */
        let peek = stack.last!
        // [endregion]{peek}
        print("Верхний элемент peek = \(peek)")

        // [region]{pop}
        /* Извлечение элемента из стека */
        let pop = stack.removeLast()
        // [endregion]{pop}
        print("Извлеченный элемент pop = \(pop), stack после извлечения = \(stack)")

        // [region]{size}
        /* Получение длины стека */
        let size = stack.count
        // [endregion]{size}
        print("Длина стека size = \(size)")

        // [region]{is_empty}
        /* Проверка на пустоту */
        let isEmpty = stack.isEmpty
        // [endregion]{is_empty}
        print("Пуст ли стек = \(isEmpty)")
    }
}
