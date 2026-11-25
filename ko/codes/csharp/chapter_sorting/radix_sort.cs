/**
 * File: radix_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class radix_sort {
    /* 원소 num의 k번째 자릿값 구하기. 여기서 exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // k 대신 exp를 전달하여 비용이 큰 거듭제곱 연산의 반복 방지
        return (num / exp) % 10;
    }

    /* 계수 정렬(nums의 k번째 자릿값 기준) */
    void CountingSortDigit(int[] nums, int exp) {
        // 십진수 한 자리의 값은 0~9이므로 길이 10인 버킷 배열이 필요함
        int[] counter = new int[10];
        int n = nums.Length;
        // 0~9의 각 숫자가 나타난 횟수 세기
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // nums[i]의 k번째 자릿값을 구해 d에 저장
            counter[d]++;                // 숫자 d의 출현 횟수 세기
        }
        // 누적합을 구해 ‘출현 횟수’를 ‘배열 인덱스’로 변환
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 역순으로 순회하며 버킷별 계수 결과에 따라 각 원소를 res에 채우기
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // 배열에서 d가 들어갈 인덱스 j 구하기
            res[j] = nums[i];       // 현재 원소를 인덱스 j에 배치
            counter[d]--;           // d의 개수를 1 줄이기
        }
        // 결과로 원래 배열 nums를 덮어쓰기
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* 기수 정렬 */
    void RadixSort(int[] nums) {
        // 최대 자릿수를 알아내기 위해 배열의 최댓값 구하기
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // 낮은 자리부터 높은 자리까지 차례로 순회
        for (int exp = 1; exp <= m; exp *= 10) {
            // 배열 원소의 k번째 자릿값을 기준으로 계수 정렬 수행
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 즉, exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }

    [Test]
    public void Test() {
        // 기수 정렬
        int[] nums = [ 10546151, 35663510, 42865989, 34862445, 81883077,
            88906420, 72429244, 30524779, 82060337, 63832996 ];
        RadixSort(nums);
        Console.WriteLine("기수 정렬 후 nums = " + string.Join(" ", nums));
    }
}
