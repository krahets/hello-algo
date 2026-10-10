/**
 * File: coin_change_greedy.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* コイン交換：貪欲法 */
int coinChangeGreedy(List<int> coins, int amt) {
  // coins リストはソート済みと仮定する
  int i = coins.length - 1;
  int count = 0;
  // 残額がなくなるまで貪欲選択を繰り返す
  while (amt > 0) {
    // 残額以下で最も近い硬貨を見つける
    while (i > 0 && coins[i] > amt) {
      i--;
    }
    // coins[i] を選択する
    amt -= coins[i];
    count++;
  }
  // 実行可能な解が見つからなければ -1 を返す
  return amt == 0 ? count : -1;
}

/* Driver Code */
void main() {
  // 貪欲法：大域最適解を保証できる
  List<int> coins = [1, 5, 10, 20, 50, 100];
  int amt = 186;
  int res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("$amt を作るのに必要な最小硬貨枚数は $res");

  // 貪欲法：大域最適解を保証できない
  coins = [1, 20, 50];
  amt = 60;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("$amt を作るのに必要な最小硬貨枚数は $res");
  print("実際に必要な最小枚数は 3 、つまり 20 + 20 + 20");

  // 貪欲法：大域最適解を保証できない
  coins = [1, 49, 50];
  amt = 98;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("$amt を作るのに必要な最小硬貨枚数は $res");
  print("実際に必要な最小枚数は 2 、つまり 49 + 49");
}
