/**
 * File: coin_change_greedy.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Coin change: Greedy */
int coinChangeGreedy(List<int> coins, int amt) {
  // Assume coins list is ordered
  int i = coins.length - 1;
  int count = 0;
  // Loop for greedy selection until no remaining amount
  while (amt > 0) {
    // Find the smallest coin close to and less than the remaining amount
    while (i > 0 && coins[i] > amt) {
      i--;
    }
    // Choose coins[i]
    amt -= coins[i];
    count++;
  }
  // If no feasible solution is found, return -1
  return amt == 0 ? count : -1;
}

/* Driver Code */
void main() {
  // Greedy: can ensure finding a global optimal solution
  List<int> coins = [1, 5, 10, 20, 50, 100];
  int amt = 186;
  int res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Minimum number of coins required to make up $amt = $res");

  // Greedy: cannot ensure finding a global optimal solution
  coins = [1, 20, 50];
  amt = 60;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Minimum number of coins required to make up $amt = $res");
  print("In reality, the minimum number needed is 3, i.e., 20 + 20 + 20");

  // Greedy: cannot ensure finding a global optimal solution
  coins = [1, 49, 50];
  amt = 98;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Minimum number of coins required to make up $amt = $res");
  print("In reality, the minimum number needed is 2, i.e., 49 + 49");
}
