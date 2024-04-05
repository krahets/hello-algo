"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """零錢兌換：貪婪"""
    # 假設 coins 串列有序
    i = len(coins) - 1
    count = 0
    # 迴圈進行貪婪選擇，直到無剩餘金額
    while amt > 0:
        # 找到小於且最接近剩餘金額的硬幣
        while i > 0 and coins[i] > amt:
            i -= 1
        # 選擇 coins[i]
        amt -= coins[i]
        count += 1
    # 若未找到可行方案，則返回 -1
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # 貪婪：能夠保證找到全域性最優解
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"湊到 {amt} 所需的最少硬幣數量為 {res}")

    # 貪婪：無法保證找到全域性最優解
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"湊到 {amt} 所需的最少硬幣數量為 {res}")
    print(f"實際上需要的最少數量為 3 ，即 20 + 20 + 20")

    # 貪婪：無法保證找到全域性最優解
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"湊到 {amt} 所需的最少硬幣數量為 {res}")
    print(f"實際上需要的最少數量為 2 ，即 49 + 49")
