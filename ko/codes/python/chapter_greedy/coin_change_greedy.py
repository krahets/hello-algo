"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """동전 교환: 탐욕"""
    # coins 리스트가 정렬되어 있다고 가정한다
    i = len(coins) - 1
    count = 0
    # 남은 금액이 없을 때까지 탐욕적 선택을 반복한다
    while amt > 0:
        # 남은 금액보다 작으면서 가장 가까운 금액의 동전을 찾는다
        while i > 0 and coins[i] > amt:
            i -= 1
        # coins[i]를 선택한다
        amt -= coins[i]
        count += 1
    # 가능한 방법을 찾지 못하면 -1을 반환한다
    return count if amt == 0 else -1


"""실행 코드"""
if __name__ == "__main__":
    # 탐욕: 전역 최적해를 찾는 것이 보장된다
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"목표 금액 {amt}에 필요한 최소 동전 개수는 {res}개이다")

    # 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"목표 금액 {amt}에 필요한 최소 동전 개수는 {res}개이다")
    print(f"실제로 필요한 최소 개수는 3개이며, 20 + 20 + 20이다")

    # 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"목표 금액 {amt}에 필요한 최소 동전 개수는 {res}개이다")
    print(f"실제로 필요한 최소 개수는 2개이며, 49 + 49이다")
