/**
 * File: iteration.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* for loop */
int forLoop(int n) {
    int res = 0;
    // Loop sum 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* while loop */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // Initialize condition variable
    // Loop sum 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Update condition variable
    }
    return res;
}

/* while loop (two updates) */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // Initialize condition variable
    // Loop sum 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Update condition variable
        i++;
        i *= 2;
    }
    return res;
}

/* Double for loop */
string nestedForLoop(int n) {
    ostringstream res;
    // Loop i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        // Loop j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    cout << "\nSum result of the for loop res = " << res << endl;

    res = whileLoop(n);
    cout << "\nSum result of the while loop res = " << res << endl;

    res = whileLoopII(n);
    cout << "\nSum result of the while loop (with two updates) res = " << res << endl;

    string resStr = nestedForLoop(n);
    cout << "\nResult of the double for loop traversal = " << resStr << endl;

    return 0;
}
