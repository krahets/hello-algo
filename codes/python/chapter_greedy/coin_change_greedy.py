"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: Krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """零钱兑换：贪心"""
    # 假设 coins 列表有序
    i = len(coins) - 1
    count = 0
    # 循环进行贪心选择，直到无剩余金额
    while amt > 0:
        # 找到小于且最接近剩余金额的硬币
        while i > 0 and coins[i] > amt:
            i -= 1
        # 选择 coins[i]
        amt -= coins[i]
        count += 1
    # 若未找到可行方案，则返回 -1
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # 贪心：能够保证找到全局最优解
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"凑到 {amt} 所需的最少硬币数量为 {res}")

    # 贪心：无法保证找到全局最优解
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"凑到 {amt} 所需的最少硬币数量为 {res}")
    print(f"实际上需要的最少数量为 3 ，即 20 + 20 + 20")

    # 贪心：无法保证找到全局最优解
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"凑到 {amt} 所需的最少硬币数量为 {res}")
    print(f"实际上需要的最少数量为 2 ，即 49 + 49")
