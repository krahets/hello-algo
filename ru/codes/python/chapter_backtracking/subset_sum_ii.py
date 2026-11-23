"""
File: subset_sum_ii.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """Алгоритм бэктрекинга: сумма подмножеств II"""
    # Если сумма подмножества равна target, записать решение
    if target == 0:
        res.append(list(state))
        return
    # Обойти все варианты выбора
    # Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    # Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
    for i in range(start, len(choices)):
        # Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        # Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if target - choices[i] < 0:
            break
        # Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
        if i > start and choices[i] == choices[i - 1]:
            continue
        # Попытка: сделать выбор и обновить target и start
        state.append(choices[i])
        # Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res)
        # Откат: отменить выбор и восстановить предыдущее состояние
        state.pop()


def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
    """Решить задачу суммы подмножеств II"""
    state = []  # Состояние (подмножество)
    nums.sort()  # Отсортировать nums
    start = 0  # Стартовая вершина обхода
    res = []  # Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 4, 5]
    target = 9
    res = subset_sum_ii(nums, target)

    print(f"Входной массив nums = {nums}, target = {target}")
    print(f"Все подмножества с суммой {target}: res = {res}")
