/**
 * File: time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class time_complexity {
    void Algorithm(int n) {
        int a = 1;  // +0 (прием 1)
        a += n;  // +0 (прием 1)
        // +n (прием 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n (прием 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                Console.WriteLine(0);
            }
        }
    }

    // Временная сложность алгоритма A: константная
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }

    // Временная сложность алгоритма B: линейная
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }

    // Временная сложность алгоритма C: константная
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }

    /* Постоянная сложность */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* Линейная сложность */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* Линейная сложность (обход массива) */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // Число итераций пропорционально длине массива
        foreach (int num in nums) {
            count++;
        }
        return count;
    }

    /* Квадратичная сложность */
    int Quadratic(int n) {
        int count = 0;
        // Число итераций квадратично зависит от размера данных n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* Квадратичная сложность (пузырьковая сортировка) */
    int BubbleSort(int[] nums) {
        int count = 0;  // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count;
    }

    /* Экспоненциальная сложность (итеративная реализация) */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* Экспоненциальная сложность (рекурсивная реализация) */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }

    /* Логарифмическая сложность (итеративная реализация) */
    int Logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }

    /* Логарифмическая сложность (рекурсивная реализация) */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }

    /* Линейно-логарифмическая сложность */
    int LinearLogRecur(int n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* Факториальная сложность (рекурсивная реализация) */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // Из одного получается n
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }

    [Test]
    public void Test() {
        // Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных сложностях
        int n = 8;
        Console.WriteLine("Размер входных данных n = " + n);

        int count = Constant(n);
        Console.WriteLine("Число операций константной сложности = " + count);

        count = Linear(n);
        Console.WriteLine("Число операций линейной сложности = " + count);
        count = ArrayTraversal(new int[n]);
        Console.WriteLine("Число операций линейной сложности (обход массива) = " + count);

        count = Quadratic(n);
        Console.WriteLine("Число операций квадратичной сложности = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i;  // [n,n-1,...,2,1]
        count = BubbleSort(nums);
        Console.WriteLine("Число операций квадратичной сложности (пузырьковая сортировка) = " + count);

        count = Exponential(n);
        Console.WriteLine("Число операций экспоненциальной сложности (итеративная реализация) = " + count);
        count = ExpRecur(n);
        Console.WriteLine("Число операций экспоненциальной сложности (рекурсивная реализация) = " + count);

        count = Logarithmic(n);
        Console.WriteLine("Число операций логарифмической сложности (итеративная реализация) = " + count);
        count = LogRecur(n);
        Console.WriteLine("Число операций логарифмической сложности (рекурсивная реализация) = " + count);

        count = LinearLogRecur(n);
        Console.WriteLine("Число операций линейно-логарифмической сложности (рекурсивная реализация) = " + count);

        count = FactorialRecur(n);
        Console.WriteLine("Число операций факториальной сложности (рекурсивная реализация) = " + count);
    }
}
