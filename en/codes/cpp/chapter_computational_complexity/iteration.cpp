/**
 * File: iteration.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* for loop */
int forLoop(int n) {
    int res = 0;
    // Sum 1, 2, ..., n-1, n in a loop
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* while loop */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // Initialize the loop control variable
    // Sum 1, 2, ..., n-1, n in a loop
    while (i <= n) {
        res += i;
        i++; // Update the loop control variable
    }
    return res;
}

/* while loop (two updates) */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // Initialize the loop control variable
    // Sum 1, 4, 10, ... in a loop
    while (i <= n) {
        res += i;
        // Update the loop control variable
        i++;
        i *= 2;
    }
    return res;
}

/* Nested for loops */
string nestedForLoop(int n) {
    ostringstream res;
    // Loop over i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        // Loop over j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* Driver code */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    cout << "\nSum from the for loop, res = " << res << endl;

    res = whileLoop(n);
    cout << "\nSum from the while loop, res = " << res << endl;

    res = whileLoopII(n);
    cout << "\nSum from the while loop with two updates, res = " << res << endl;

    string resStr = nestedForLoop(n);
    cout << "\nTraversal result from the nested for loops: " << resStr << endl;

    return 0;
}
