"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """Перенос одного диска"""
    # Снимаем верхний диск с src
    pan = src.pop()
    # Кладём диск на вершину tar
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """Решение задачи о ханойских башнях f(i)"""
    # Если с src осталось перенести один диск, кладём его сразу на tar
    if i == 1:
        move(src, tar)
        return
    # Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
    dfs(i - 1, src, tar, buf)
    # Подзадача f(1): переносим оставшийся диск с src на tar
    move(src, tar)
    # Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """Решение задачи о ханойских башнях"""
    n = len(A)
    # Переносим n верхних дисков с A на C с помощью B
    dfs(n, A, B, C)


"""Driver Code"""
if __name__ == "__main__":
    # Последний элемент списка соответствует вершине стержня
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("Исходное состояние:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("После переноса дисков:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
