<?php
/**
 * File: worst_best_time_complexity.php
 * Created Time: 2025-11-06
 * Author: Leo Mu (whatissrc@gmail.com)
 */

namespace chapter_computational_complexity;

class WorstBestTimeComplexity
{
    // 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱
    public static function randomNumbers(int $n): array
    {
        // 生成数组 nums = { 1, 2, 3, ..., n }
        $nums = [];
        for ($i = 0; $i < $n; $i++) {
            $nums[$i] = $i + 1;
        }
        // 随机打乱数组元素
        shuffle($nums);
        return $nums;
    }

    // 查找数组 nums 中数字 1 所在索引
    public static function findOne(array $nums): int
    {
        for ($i = 0; $i < count($nums); $i++) {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if ($nums[$i] == 1) {
                return $i;
            }
        }
        return -1;
    }

}

// Driver Code
for ($i = 0; $i < 10; $i++) {
    $n = 100;
    $nums = WorstBestTimeComplexity::randomNumbers($n);
    $index = WorstBestTimeComplexity::findOne($nums);
    echo "\n数组 [ 1, 2, ..., n ] 被打乱后 = " . json_encode(array_slice($nums, 0, 10)) . "...\n";
    echo "数字 1 的索引为 " . $index . "\n";
}
