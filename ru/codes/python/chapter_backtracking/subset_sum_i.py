"""
File: subset_sum_i.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """Алгоритм бэктрекинга: сумма подмножеств I"""
    # Если сумма подмножества равна target, записать решение
    if target == 0:
        res.append(list(state))
        return
    # Обойти все варианты выбора
    # Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    for i in range(start, len(choices)):
        # Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        # Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if target - choices[i] < 0:
            break
        # Попытка: сделать выбор и обновить target и start
        state.append(choices[i])
        # Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i, res)
        # Откат: отменить выбор и восстановить предыдущее состояние
        state.pop()


def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
    """Решить задачу суммы подмножеств I"""
    state = []  # Состояние (подмножество)
    nums.sort()  # Отсортировать nums
    start = 0  # Стартовая вершина обхода
    res = []  # Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i(nums, target)

    print(f"Входной массив nums = {nums}, target = {target}")
    print(f"Все подмножества с суммой {target}: res = {res}")
