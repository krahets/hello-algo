/**
 * File: bucket_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bucket_sort {
    /* 버킷 정렬 */
    static void bucketSort(float[] nums) {
        // 버킷 k = n/2개를 초기화하며, 각 버킷에 원소 2개가 배정될 것으로 예상한다
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. 배열 원소를 각 버킷에 배정한다
        for (float num : nums) {
            // 입력 데이터의 범위는 [0, 1)이며, num * k를 사용하여 인덱스 범위 [0, k-1]에 대응시킨다
            int i = (int) (num * k);
            // num을 버킷 i에 추가한다
            buckets.get(i).add(num);
        }
        // 2. 각 버킷을 정렬한다
        for (List<Float> bucket : buckets) {
            // 내장 정렬 함수를 사용하며, 다른 정렬 알고리즘으로 대체할 수도 있다
            Collections.sort(bucket);
        }
        // 3. 버킷을 순회하여 결과를 합친다
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }

    public static void main(String[] args) {
        // 입력 데이터는 범위가 [0, 1)인 부동 소수점 수라고 가정한다
        float[] nums = { 0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f };
        bucketSort(nums);
        System.out.println("버킷 정렬을 마친 후 nums = " + Arrays.toString(nums));
    }
}
