/**
 * File: coin_change_greedy.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Greedy coin change */
int coinChangeGreedy(List<int> coins, int amt) {
  // Assume the coins list is sorted
  int i = coins.length - 1;
  int count = 0;
  // Make greedy choices until no amount remains
  while (amt > 0) {
    // Find the largest denomination that does not exceed the remaining amount
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
  // Greedy choices are guaranteed to give a global optimum here
  List<int> coins = [1, 5, 10, 20, 50, 100];
  int amt = 186;
  int res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("The minimum number of coins needed to make $amt is $res");

  // Greedy choices do not guarantee a global optimum here
  coins = [1, 20, 50];
  amt = 60;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("The minimum number of coins needed to make $amt is $res");
  print("The actual minimum is 3 coins: 20 + 20 + 20");

  // Greedy choices do not guarantee a global optimum here
  coins = [1, 49, 50];
  amt = 98;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("The minimum number of coins needed to make $amt is $res");
  print("The actual minimum is 2 coins: 49 + 49");
}
