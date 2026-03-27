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
    """Алгоритм бэктрекинга: сумма подмножеств I"""
    # Если сумма подмножества равна target, записать решение
    if total == target:
        res.append(list(state))
        return
    # Перебор всех вариантов выбора
    for i in range(len(choices)):
        # Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        if total + choices[i] > target:
            continue
        # Попытка: сделать выбор и обновить элемент и total
        state.append(choices[i])
        # Перейти к следующему выбору
        backtrack(state, target, total + choices[i], choices, res)
        # Откат: отменить выбор и восстановить предыдущее состояние
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """Решить задачу суммы подмножеств I (с повторяющимися подмножествами)"""
    state = []  # Состояние (подмножество)
    total = 0  # Сумма подмножеств
    res = []  # Список результатов (список подмножеств)
    backtrack(state, target, total, nums, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"Входной массив nums = {nums}, target = {target}")
    print(f"Все подмножества с суммой {target}: res = {res}")
    print(f"Обратите внимание: результат этого метода содержит повторяющиеся множества")
