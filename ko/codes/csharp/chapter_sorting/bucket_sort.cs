/**
 * File: bucket_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class bucket_sort {
    /* 버킷 정렬 */
    void BucketSort(float[] nums) {
        // 버킷 k = n/2개를 초기화하며, 각 버킷에 원소 2개가 배정될 것으로 예상한다
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. 배열 원소를 각 버킷에 배정한다
        foreach (float num in nums) {
            // 입력 데이터의 범위는 [0, 1)이며, num * k를 사용하여 인덱스 범위 [0, k-1]에 대응시킨다
            int i = (int)(num * k);
            // num을 버킷 i에 추가한다
            buckets[i].Add(num);
        }
        // 2. 각 버킷을 정렬한다
        foreach (List<float> bucket in buckets) {
            // 내장 정렬 함수를 사용하며, 다른 정렬 알고리즘으로 대체할 수도 있다
            bucket.Sort();
        }
        // 3. 버킷을 순회하여 결과를 합친다
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }

    [Test]
    public void Test() {
        // 입력 데이터는 범위가 [0, 1)인 부동 소수점 수라고 가정한다
        float[] nums = [0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f];
        BucketSort(nums);
        Console.WriteLine("버킷 정렬을 마친 후 nums = " + string.Join(" ", nums));
    }
}
