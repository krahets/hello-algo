"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """硬貨交換：貪欲法"""
    # coins リストがソートされていると仮定
    i = len(coins) - 1
    count = 0
    # 残り金額がなくなるまで貪欲選択をループ
    while amt > 0:
        # 残り金額に最も近く、それより小さい硬貨を見つける
        while i > 0 and coins[i] > amt:
            i -= 1
        # coins[i] を選択
        amt -= coins[i]
        count += 1
    # 実行可能な解が見つからない場合、-1 を返す
    return count if amt == 0 else -1


"""ドライバーコード"""
if __name__ == "__main__":
    # 貪欲法：大域最適解の発見を保証できる
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"{amt} を構成するのに必要な硬貨の最小数は {res}")

    # 貪欲法：大域最適解の発見を保証できない
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"{amt} を構成するのに必要な硬貨の最小数は {res}")
    print(f"実際には必要な最小数は 3、つまり 20 + 20 + 20")

    # 貪欲法：大域最適解の発見を保証できない
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"{amt} を構成するのに必要な硬貨の最小数は {res}")
    print(f"実際には必要な最小数は 2、つまり 49 + 49")