"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """零錢兌換：貪婪法"""
    # 假設硬幣清單 coins 已依面額遞增排序
    i = len(coins) - 1
    count = 0
    # 反覆依貪婪策略選取硬幣，直到剩餘金額為零
    while amt > 0:
        # 找出不超過剩餘金額的最大面額
        while i > 0 and coins[i] > amt:
            i -= 1
        # 選取 coins[i]
        amt -= coins[i]
        count += 1
    # 若找不到可行解，則回傳 -1
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # 貪婪法：保證能找到全域最佳解
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"湊出 {amt} 所需的最少硬幣數為 {res}")

    # 貪婪法：無法保證找到全域最佳解
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"湊出 {amt} 所需的最少硬幣數為 {res}")
    print(f"實際上最少只需 3 枚，即 20 + 20 + 20")

    # 貪婪法：無法保證找到全域最佳解
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"湊出 {amt} 所需的最少硬幣數為 {res}")
    print(f"實際上最少只需 2 枚，即 49 + 49")
