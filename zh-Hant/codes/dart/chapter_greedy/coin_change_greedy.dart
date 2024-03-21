/**
 * File: coin_change_greedy.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 零錢兌換：貪婪 */
int coinChangeGreedy(List<int> coins, int amt) {
  // 假設 coins 串列有序
  int i = coins.length - 1;
  int count = 0;
  // 迴圈進行貪婪選擇，直到無剩餘金額
  while (amt > 0) {
    // 找到小於且最接近剩餘金額的硬幣
    while (i > 0 && coins[i] > amt) {
      i--;
    }
    // 選擇 coins[i]
    amt -= coins[i];
    count++;
  }
  // 若未找到可行方案，則返回 -1
  return amt == 0 ? count : -1;
}

/* Driver Code */
void main() {
  // 貪婪：能夠保證找到全域性最優解
  List<int> coins = [1, 5, 10, 20, 50, 100];
  int amt = 186;
  int res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("湊到 $amt 所需的最少硬幣數量為 $res");

  // 貪婪：無法保證找到全域性最優解
  coins = [1, 20, 50];
  amt = 60;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("湊到 $amt 所需的最少硬幣數量為 $res");
  print("實際上需要的最少數量為 3 ，即 20 + 20 + 20");

  // 貪婪：無法保證找到全域性最優解
  coins = [1, 49, 50];
  amt = 98;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("湊到 $amt 所需的最少硬幣數量為 $res");
  print("實際上需要的最少數量為 2 ，即 49 + 49");
}
