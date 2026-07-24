/**
 * File: max_product_cutting.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++规范、去除浮点pow精度隐患、代码严谨化
 */

#include "../utils/common.hpp"
#include <iostream>

// 快速幂求整数次幂，避免pow浮点误差
static long long quickPow(int base, int exp)
{
    long long res = 1;
    while (exp > 0)
    {
        res *= base;
        exp--;
    }
    return res;
}

/* 最大切分乘积：贪心 */
int maxProductCutting(int n)
{
    // n <= 3 必须分出一个1
    if (n <= 3)
    {
        return 1 * (n - 1);
    }
    int a = n / 3;
    int b = n % 3;

    if (b == 1)
    {
        return static_cast<int>(quickPow(3, a - 1) * 4);
    }
    else if (b == 2)
    {
        return static_cast<int>(quickPow(3, a) * 2);
    }
    else
    {
        return static_cast<int>(quickPow(3, a));
    }
}

/* Driver Code */
int main()
{
    int n = 58;
    int res = maxProductCutting(n);
    std::cout << "最大切分乘积为：" << res << '\n';
    return 0;
}
