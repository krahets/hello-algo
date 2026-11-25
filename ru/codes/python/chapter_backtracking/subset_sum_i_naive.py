"""
File: subset_sum_i_naive.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int],
    target: int,
    total: int,
    choices: list[int],
    res: list[list[int]],
):
    """Поиск с возвратом: сумма подмножества I"""
    # Если сумма подмножества равна target, сохраняем решение
    if total == target:
        res.append(list(state))
        return
    # Перебираем все варианты
    for i in range(len(choices)):
        # Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
        if total + choices[i] > target:
            continue
        # Пробуем вариант и обновляем сумму элементов total
        state.append(choices[i])
        # Переходим к следующему выбору
        backtrack(state, target, total + choices[i], choices, res)
        # Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """Задача о сумме подмножества I (с повторяющимися подмножествами)"""
    state = []  # Состояние (подмножество)
    total = 0  # Сумма подмножества
    res = []  # Список результатов (список подмножеств)
    backtrack(state, target, total, nums, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"Исходный массив nums = {nums}, target = {target}")
    print(f"Все подмножества с суммой {target}: res = {res}")
    print(f"Обратите внимание: результат этого метода содержит повторяющиеся множества")
