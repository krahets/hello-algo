"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """Переместить один диск"""
    # Снять диск с вершины src
    pan = src.pop()
    # Положить диск на вершину tar
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """Решить задачу Ханойской башни f(i)"""
    # Если в src остался только один диск, сразу переместить его в tar
    if i == 1:
        move(src, tar)
        return
    # Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
    dfs(i - 1, src, tar, buf)
    # Подзадача f(1): переместить оставшийся один диск из src в tar
    move(src, tar)
    # Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """Решить задачу Ханойской башни"""
    n = len(A)
    # Переместить верхние n дисков из A в C с помощью B
    dfs(n, A, B, C)


"""Driver Code"""
if __name__ == "__main__":
    # Хвост списка соответствует вершине столбца
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("Исходное состояние:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("После завершения перемещения дисков:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
