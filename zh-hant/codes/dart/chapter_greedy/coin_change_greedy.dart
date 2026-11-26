/**
 * File: coin_change_greedy.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 零錢兌換：貪婪法 */
int coinChangeGreedy(List<int> coins, int amt) {
  // 假設硬幣清單 coins 已依面額遞增排序
  int i = coins.length - 1;
  int count = 0;
  // 反覆依貪婪策略選取硬幣，直到剩餘金額為零
  while (amt > 0) {
    // 找出不超過剩餘金額的最大面額
    while (i > 0 && coins[i] > amt) {
      i--;
    }
    // 選取 coins[i]
    amt -= coins[i];
    count++;
  }
  // 若找不到可行解，則回傳 -1
  return amt == 0 ? count : -1;
}

/* 主程式 */
void main() {
  // 貪婪法：保證能找到全域最佳解
  List<int> coins = [1, 5, 10, 20, 50, 100];
  int amt = 186;
  int res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("湊出 $amt 所需的最少硬幣數為 $res");

  // 貪婪法：無法保證找到全域最佳解
  coins = [1, 20, 50];
  amt = 60;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("湊出 $amt 所需的最少硬幣數為 $res");
  print("實際上最少只需 3 枚，即 20 + 20 + 20");

  // 貪婪法：無法保證找到全域最佳解
  coins = [1, 49, 50];
  amt = 98;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("湊出 $amt 所需的最少硬幣數為 $res");
  print("實際上最少只需 2 枚，即 49 + 49");
}
