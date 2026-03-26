/**
* File: max_product_cutting.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_product_cutting {
    /* Максимальное произведение разбиения: жадный алгоритм */
    int MaxProductCutting(int n) {
        // Когда n <= 3, необходимо отделить одну 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Жадно выделить части по 3, где a — число троек, а b — остаток
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // Когда остаток равен 1, преобразовать пару 1 * 3 в 2 * 2
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // Когда остаток равен 2, ничего делать не нужно
            return (int)Math.Pow(3, a) * 2;
        }
        // Когда остаток равен 0, ничего делать не нужно
        return (int)Math.Pow(3, a);
    }

    [Test]
    public void Test() {
        int n = 58;

        // Жадный алгоритм
        int res = MaxProductCutting(n);
        Console.WriteLine("максимальное произведение разбиенияравно" + res);
    }
}
