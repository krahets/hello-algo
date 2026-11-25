"""
File: subset_sum_ii.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """Поиск с возвратом: сумма подмножества II"""
    # Если сумма подмножества равна target, сохраняем решение
    if target == 0:
        res.append(list(state))
        return
    # Перебираем все варианты
    # Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
    # Отсечение 3: начинаем перебор с start, чтобы не брать один и тот же элемент дважды
    for i in range(start, len(choices)):
        # Отсечение 1: если сумма подмножества превышает target, выходим из цикла
        # Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
        if target - choices[i] < 0:
            break
        # Отсечение 4: если значение совпало с уже проверенным на этом шаге соседом слева, пропускаем повторную ветвь
        if i > start and choices[i] == choices[i - 1]:
            continue
        # Пробуем вариант и обновляем target и start
        state.append(choices[i])
        # Переходим к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res)
        # Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.pop()


def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
    """Задача о сумме подмножества II"""
    state = []  # Состояние (подмножество)
    nums.sort()  # Сортируем nums
    start = 0  # Начальная позиция перебора
    res = []  # Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 4, 5]
    target = 9
    res = subset_sum_ii(nums, target)

    print(f"Исходный массив nums = {nums}, target = {target}")
    print(f"Все подмножества с суммой {target}: res = {res}")
