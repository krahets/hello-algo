/**
 * File: bucket_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class bucket_sort {
    /* 버킷 정렬 */
    void BucketSort(float[] nums) {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. 배열 원소를 각 버킷에 배분
        foreach (float num in nums) {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            int i = (int)(num * k);
            // num을 버킷 i에 추가
            buckets[i].Add(num);
        }
        // 2. 각 버킷을 정렬
        foreach (List<float> bucket in buckets) {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            bucket.Sort();
        }
        // 3. 버킷을 순회하여 결과 병합
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }

    [Test]
    public void Test() {
        // 입력은 [0, 1) 범위의 부동 소수점 수로 가정
        float[] nums = [0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f];
        BucketSort(nums);
        Console.WriteLine("버킷 정렬 후 nums = " + string.Join(" ", nums));
    }
}
