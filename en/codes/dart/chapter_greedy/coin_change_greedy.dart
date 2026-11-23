/**
 * File: coin_change_greedy.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Coin change: greedy algorithm */
int coinChangeGreedy(List<int> coins, int amt) {
  // Assume the coins list is sorted in ascending order
  int i = coins.length - 1;
  int count = 0;
  // Repeatedly make greedy choices until no amount remains
  while (amt > 0) {
    // Find the largest coin no greater than the remaining amount
    while (i > 0 && coins[i] > amt) {
      i--;
    }
    // Choose coins[i]
    amt -= coins[i];
    count++;
  }
  // Return -1 if no feasible solution was found
  return amt == 0 ? count : -1;
}

/* Driver code */
void main() {
  // Greedy algorithm: guaranteed to find a globally optimal solution
  List<int> coins = [1, 5, 10, 20, 50, 100];
  int amt = 186;
  int res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Number of coins chosen by the greedy algorithm to make $amt: $res");

  // Greedy algorithm: not guaranteed to find a globally optimal solution
  coins = [1, 20, 50];
  amt = 60;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Number of coins chosen by the greedy algorithm to make $amt: $res");
  print("The actual minimum is 3 coins: 20 + 20 + 20");

  // Greedy algorithm: not guaranteed to find a globally optimal solution
  coins = [1, 49, 50];
  amt = 98;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Number of coins chosen by the greedy algorithm to make $amt: $res");
  print("The actual minimum is 2 coins: 49 + 49");
}
