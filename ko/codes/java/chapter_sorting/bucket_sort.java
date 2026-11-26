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
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. 배열 원소를 각 버킷에 배분
        for (float num : nums) {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            int i = (int) (num * k);
            // num을 버킷 i에 추가
            buckets.get(i).add(num);
        }
        // 2. 각 버킷을 정렬
        for (List<Float> bucket : buckets) {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            Collections.sort(bucket);
        }
        // 3. 버킷을 순회하여 결과 병합
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }

    public static void main(String[] args) {
        // 입력은 [0, 1) 범위의 부동 소수점 수로 가정
        float[] nums = { 0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f };
        bucketSort(nums);
        System.out.println("버킷 정렬 후 nums = " + Arrays.toString(nums));
    }
}
