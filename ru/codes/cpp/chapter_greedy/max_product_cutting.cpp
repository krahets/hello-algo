/**
 * File: max_product_cutting.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Максимальное произведение разбиения: жадный алгоритм */
int maxProductCutting(int n) {
    // Когда n <= 3, необходимо отделить одну 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Жадно выделить части по 3, где a — число троек, а b — остаток
    int a = n / 3;
    int b = n % 3;
    if (b == 1) {
        // Когда остаток равен 1, преобразовать пару 1 * 3 в 2 * 2
        return (int)pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // Когда остаток равен 2, ничего делать не нужно
        return (int)pow(3, a) * 2;
    }
    // Когда остаток равен 0, ничего делать не нужно
    return (int)pow(3, a);
}

/* Driver Code */
int main() {
    int n = 58;

    // Жадный алгоритм
    int res = maxProductCutting(n);
    cout << "максимальное произведение разбиенияравно" << res << endl;

    return 0;
}
