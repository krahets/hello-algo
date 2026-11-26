"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """硬貨の両替（貪欲法）"""
    # リスト coins はソート済みとする
    i = len(coins) - 1
    count = 0
    # 残額がなくなるまで貪欲選択を繰り返す
    while amt > 0:
        # 残額以下で額面が最大の硬貨を探す
        while i > 0 and coins[i] > amt:
            i -= 1
        # coins[i] を選ぶ
        amt -= coins[i]
        count += 1
    # 解が見つからなければ -1 を返す
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # 貪欲法で大域的最適解が必ず求まる例
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"金額 {amt} を作るのに必要な硬貨の最少枚数は {res}")

    # 貪欲法では大域的最適解を保証できない例
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"金額 {amt} を作るのに必要な硬貨の最少枚数は {res}")
    print(f"実際の最少枚数は 3 枚（20 + 20 + 20）")

    # 貪欲法では大域的最適解を保証できない例
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"金額 {amt} を作るのに必要な硬貨の最少枚数は {res}")
    print(f"実際の最少枚数は 2 枚（49 + 49）")
