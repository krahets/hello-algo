/**
 * File: time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class time_complexity {
    void Algorithm(int n) {
        int a = 1;  // +0(요령 1)
        a += n;  // +0(요령 1)
        // +n(요령 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n(요령 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                Console.WriteLine(0);
            }
        }
    }

    // 알고리즘 A의 시간 복잡도: 상수 차수
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }

    // 알고리즘 B의 시간 복잡도: 선형 차수
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }

    // 알고리즘 C의 시간 복잡도: 상수 차수
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }

    /* 상수 차수 */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }

    /* 선형 차수 */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }

    /* 선형 차수(배열 순회) */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // 반복 횟수는 배열 길이에 비례한다
        foreach (int num in nums) {
            count++;
        }
        return count;
    }

    /* 제곱 차수 */
    int Quadratic(int n) {
        int count = 0;
        // 반복 횟수는 데이터 크기 n의 제곱에 비례한다
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }

    /* 제곱 차수(버블 정렬) */
    int BubbleSort(int[] nums) {
        int count = 0;  // 카운터
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
        for (int i = nums.Length - 1; i > 0; i--) {
            // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j]와 nums[j + 1]을 교환한다
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // 원소 교환에는 단위 연산 3회가 포함된다
                }
            }
        }
        return count;
    }

    /* 지수 차수(반복문 구현) */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // 세포가 매번 둘로 나뉘어 수열 1, 2, 4, 8, ..., 2^(n-1)을 이룬다
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }

    /* 지수 차수(재귀 구현) */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }

    /* 로그 차수(반복문 구현) */
    int Logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }

    /* 로그 차수(재귀 구현) */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }

    /* 선형 로그 차수 */
    int LinearLogRecur(int n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }

    /* 팩토리얼 차수(재귀 구현) */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // 하나에서 n개로 분열한다
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }

    [Test]
    public void Test() {
        // n을 바꾸어 실행하면서 각 복잡도에서 연산 횟수가 어떻게 변하는지 살펴볼 수 있다
        int n = 8;
        Console.WriteLine("입력 데이터 크기 n = " + n);

        int count = Constant(n);
        Console.WriteLine("상수 차수의 연산 횟수 = " + count);

        count = Linear(n);
        Console.WriteLine("선형 차수의 연산 횟수 = " + count);
        count = ArrayTraversal(new int[n]);
        Console.WriteLine("선형 차수(배열 순회)의 연산 횟수 = " + count);

        count = Quadratic(n);
        Console.WriteLine("제곱 차수의 연산 횟수 = " + count);
        int[] nums = new int[n];
        for (int i = 0; i < n; i++)
            nums[i] = n - i;  // [n,n-1,...,2,1]
        count = BubbleSort(nums);
        Console.WriteLine("제곱 차수(버블 정렬)의 연산 횟수 = " + count);

        count = Exponential(n);
        Console.WriteLine("지수 차수(반복문 구현)의 연산 횟수 = " + count);
        count = ExpRecur(n);
        Console.WriteLine("지수 차수(재귀 구현)의 연산 횟수 = " + count);

        count = Logarithmic(n);
        Console.WriteLine("로그 차수(반복문 구현)의 연산 횟수 = " + count);
        count = LogRecur(n);
        Console.WriteLine("로그 차수(재귀 구현)의 연산 횟수 = " + count);

        count = LinearLogRecur(n);
        Console.WriteLine("선형 로그 차수(재귀 구현)의 연산 횟수 = " + count);

        count = FactorialRecur(n);
        Console.WriteLine("팩토리얼 차수(재귀 구현)의 연산 횟수 = " + count);
    }
}
