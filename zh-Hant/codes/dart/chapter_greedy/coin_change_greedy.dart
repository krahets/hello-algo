/**
 * File: coin_change_greedy.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 零钱兑换：贪心 */
int coinChangeGreedy(List<int> coins, int amt) {
  // 假设 coins 列表有序
  int i = coins.length - 1;
  int count = 0;
  // 循环进行贪心选择，直到无剩余金额
  while (amt > 0) {
    // 找到小于且最接近剩余金额的硬币
    while (i > 0 && coins[i] > amt) {
      i--;
    }
    // 选择 coins[i]
    amt -= coins[i];
    count++;
  }
  // 若未找到可行方案，则返回 -1
  return amt == 0 ? count : -1;
}

/* Driver Code */
void main() {
  // 贪心：能够保证找到全局最优解
  List<int> coins = [1, 5, 10, 20, 50, 100];
  int amt = 186;
  int res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("凑到 $amt 所需的最少硬币数量为 $res");

  // 贪心：无法保证找到全局最优解
  coins = [1, 20, 50];
  amt = 60;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("凑到 $amt 所需的最少硬币数量为 $res");
  print("实际上需要的最少数量为 3 ，即 20 + 20 + 20");

  // 贪心：无法保证找到全局最优解
  coins = [1, 49, 50];
  amt = 98;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("凑到 $amt 所需的最少硬币数量为 $res");
  print("实际上需要的最少数量为 2 ，即 49 + 49");
}
