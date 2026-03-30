"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """コイン交換：貪欲法"""
    # coins リストはソート済みと仮定する
    i = len(coins) - 1
    count = 0
    # 残額がなくなるまで貪欲選択を繰り返す
    while amt > 0:
        # 残額以下で最も近い硬貨を見つける
        while i > 0 and coins[i] > amt:
            i -= 1
        # coins[i] を選択する
        amt -= coins[i]
        count += 1
    # 実行可能な解が見つからなければ -1 を返す
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # 貪欲法：大域最適解を保証できる
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"{amt} を作るのに必要な最小の硬貨枚数は {res}")

    # 貪欲法：大域最適解を保証できない
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"{amt} を作るのに必要な最小の硬貨枚数は {res}")
    print(f"実際に必要な最小枚数は 3 ，つまり 20 + 20 + 20")

    # 貪欲法：大域最適解を保証できない
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"{amt} を作るのに必要な最小の硬貨枚数は {res}")
    print(f"実際に必要な最小枚数は 2 ，つまり 49 + 49")
