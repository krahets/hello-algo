/**
 * File: time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class time_complexity {
    /* Постоянная сложность */
    static int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* Линейная сложность */
    static int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* Линейная сложность (обход массива) */
    static int arrayTraversal(int[] nums) {
        int count = 0;
        // Число итераций пропорционально длине массива
        for (int num : nums) {
            count++;
        }
        return count;
    }

    /* Квадратичная сложность */
    static int quadratic(int n) {
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
    static int bubbleSort(int[] nums) {
        int count = 0; // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count;
    }

    /* Экспоненциальная сложность (итеративная реализация) */
    static int exponential(int n) {
        int count = 0, base = 1;
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* Экспоненциальная сложность (рекурсивная реализация) */
    static int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /* Логарифмическая сложность (итеративная реализация) */
    static int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }

    /* Логарифмическая сложность (рекурсивная реализация) */
    static int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }

    /* Линейно-логарифмическая сложность */
    static int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* Факториальная сложность (рекурсивная реализация) */
    static int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // Из одного получается n
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }

    /* Driver Code */
    public static void main(String[] args) {
        // Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных сложностях
        int n = 8;
        System.out.println("Размер входных данных n = " + n);

        int count = constant(n);
        System.out.println("Число операций константной сложности = " + count);

        count = linear(n);
        System.out.println("Число операций линейной сложности = " + count);
        count = arrayTraversal(new int[n]);
        System.out.println("Число операций линейной сложности (обход массива) = " + count);

        count = quadratic(n);
        System.out.println("Число операций квадратичной сложности = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i; // [n,n-1,...,2,1]
        count = bubbleSort(nums);
        System.out.println("Число операций квадратичной сложности (пузырьковая сортировка) = " + count);

        count = exponential(n);
        System.out.println("Число операций экспоненциальной сложности (итеративная реализация) = " + count);
        count = expRecur(n);
        System.out.println("Число операций экспоненциальной сложности (рекурсивная реализация) = " + count);

        count = logarithmic(n);
        System.out.println("Число операций логарифмической сложности (итеративная реализация) = " + count);
        count = logRecur(n);
        System.out.println("Число операций логарифмической сложности (рекурсивная реализация) = " + count);

        count = linearLogRecur(n);
        System.out.println("Число операций линейно-логарифмической сложности (рекурсивная реализация) = " + count);

        count = factorialRecur(n);
        System.out.println("Число операций факториальной сложности (рекурсивная реализация) = " + count);
    }
}
