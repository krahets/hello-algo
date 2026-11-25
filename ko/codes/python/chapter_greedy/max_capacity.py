"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """탐욕 알고리즘으로 최대 용량 구하기"""
    # i와 j를 각각 배열의 양 끝에 놓는다
    i, j = 0, len(ht) - 1
    # 최대 용량의 초깃값은 0이다
    res = 0
    # 두 칸막이가 만날 때까지 탐욕 선택을 반복한다
    while i < j:
        # 최대 용량을 갱신한다
        cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        # 낮은 칸막이 쪽을 안으로 한 칸 옮긴다
        if ht[i] < ht[j]:
            i += 1
        else:
            j -= 1
    return res


"""Driver Code"""
if __name__ == "__main__":
    ht = [3, 8, 5, 2, 7, 7, 3, 4]

    # 탐욕 알고리즘
    res = max_capacity(ht)
    print(f"최대 용량: {res}")
