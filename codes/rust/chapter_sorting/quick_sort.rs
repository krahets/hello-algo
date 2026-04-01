/*
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

// 快速排序没有状态，本应实现为函数，此处却为结构体的关联函数（类似于类的静态方法），
// 实属面向对象风味代码。究其原因，当前版本的《Hello 算法》一书中以如下方式链接了
// 快速排序代码：
//
// [file]{quick_sort}-[class]{quick_sort}-[func]{quick_sort}
//
// 其影响甚广，涉及所有语言的实现，故暂时维持原状。

/* 快速排序 */
pub struct QuickSort;

impl QuickSort {
    /* 哨兵划分 */
    fn partition(nums: &mut [i32]) -> usize {
        // 以数组最左侧为基准数
        let mut i = 0;
        // 注意：目前 nums.len() >= 1 由 Self::quick_sort 保证;
        // 作为一个独立的函数，此处应当增加对空数组的处理以提升健壮性，
        // 否则应该内联到 Self::quick_sort 中
        let mut j = nums.len() - 1;
        while i < j {
            // 从右向左找首个小于基准数的元素
            while i < j && nums[j] >= nums[0] {
                j -= 1;
            }
            // 从左向右找首个大于基准数的元素
            while i < j && nums[i] <= nums[0] {
                i += 1;
            }
            // 交换这两个元素
            nums.swap(i, j);
        }
        // 将基准数交换至两子数组的分界线
        nums.swap(i, 0);
        // 返回基准数的索引
        i
    }

    /* 快速排序 */
    pub fn quick_sort(nums: &mut [i32]) {
        // 子数组长度小于等于 1 时终止递归
        if nums.len() <= 1 {
            return;
        }
        // 哨兵划分
        let pivot = Self::partition(nums);

        // 相比直接传递原数组的切片和左右索引，这里传入子数组切片更安全，
        // 因为它不会因为调用者传入错误索引而越界 panic

        // 递归排序左子数组 [0, pivot - 1]
        // 注意，这里不能使用 0..=(pivot - 1)， 因为 pivot == 0 时
        // 会发生减法溢出（可以通过构造升序序列观察到这一行为）
        Self::quick_sort(&mut nums[0..pivot]);
        // 递归排序右子数组 [pivot + 1, nums.len() - 1]
        Self::quick_sort(&mut nums[(pivot + 1)..]);
    }
}

/* 快速排序（中位基准数优化） */
pub struct QuickSortMedian;

impl QuickSortMedian {
    /* 选取三个候选元素的中位数 */
    fn median_three(nums: &mut [i32]) -> usize {
        let left = 0;
        // 注意：目前 nums.len() >= 1 由 Self::quick_sort 保证;
        // 作为一个独立的函数，此处应当增加对空数组的处理以提升健壮性，
        // 否则应该内联到 Self::quick_sort 中
        let right = nums.len() - 1;
        let mid = right / 2;

        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            // m 在 l 和 r 之间
            return mid;
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            // l 在 r 和 m 之间
            return left;
        }
        // r 在 m 和 l 之间
        right
    }

    /* 哨兵划分（三数取中值） */
    fn partition(nums: &mut [i32]) -> usize {
        // 选取三个候选元素的中位数
        let med = Self::median_three(nums);
        // 将中位数交换至数组最左端
        nums.swap(0, med);
        // 以数组最左侧为基准数
        let mut i = 0;
        // 注意：目前 nums.len() >= 1 由 Self::quick_sort 保证;
        // 作为一个独立的函数，此处应当增加对空数组的处理以提升健壮性，
        // 否则应该内联到 Self::quick_sort 中
        let mut j = nums.len() - 1;
        while i < j {
            // 从右向左找首个小于基准数的元素
            while i < j && nums[j] >= nums[0] {
                j -= 1;
            }
            // 从左向右找首个大于基准数的元素
            while i < j && nums[i] <= nums[0] {
                i += 1;
            }
            // 交换这两个元素
            nums.swap(i, j);
        }
        // 将基准数交换至两子数组的分界线
        nums.swap(i, 0);
        // 返回基准数的索引
        i
    }

    /* 快速排序 */
    pub fn quick_sort(nums: &mut [i32]) {
        // 子数组长度小于等于 1 时终止递归
        if nums.len() <= 1 {
            return;
        }
        // 哨兵划分
        let pivot = Self::partition(nums);
        // 递归排序左子数组 [0, pivot - 1]
        // 注意，这里不能使用 left..=(pivot - 1)， 因为 pivot == 0 时
        // 会发生减法溢出（可以通过构造等值序列观察到这一行为）
        Self::quick_sort(&mut nums[0..pivot]);
        // 递归排序右子数组 [pivot + 1, nums.len() - 1]
        Self::quick_sort(&mut nums[(pivot + 1)..]);
    }
}

/* 快速排序（递归深度优化） */
pub struct QuickSortTailCall;

impl QuickSortTailCall {
    /* 哨兵划分 */
    fn partition(nums: &mut [i32]) -> usize {
        // 以数组最左侧为基准数
        let mut i = 0;
        // 注意：目前 nums.len() >= 1 由 Self::quick_sort 保证;
        // 作为一个独立的函数，此处应当增加对空数组的处理以提升健壮性，
        // 否则应该内联到 Self::quick_sort 中
        let mut j = nums.len() - 1;
        while i < j {
            // 从右向左找首个小于基准数的元素
            while i < j && nums[j] >= nums[0] {
                j -= 1;
            }
            // 从左向右找首个大于基准数的元素
            while i < j && nums[i] <= nums[0] {
                i += 1;
            }
            // 交换这两个元素
            nums.swap(i, j);
        }
        // 将基准数交换至两子数组的分界线
        nums.swap(i, 0);
        // 返回基准数的索引
        i
    }

    /* 快速排序（递归深度优化） */
    pub fn quick_sort(nums: &mut [i32]) {
        // 子数组长度小于等于 1 时终止递归
        if nums.len() <= 1 {
            return;
        }
        let mut left = 0;
        let mut right = nums.len() - 1;
        while left < right {
            // 哨兵划分操作
            let pivot = left + Self::partition(&mut nums[left..=right]);
            // 对两个子数组中较短的那个执行快速排序
            if pivot - left < right - pivot {
                // 递归排序左子数组 [left, pivot - 1]
                // 注意，这里不能使用 left..=(pivot - 1)， 因为 pivot == 0 时
                // 会发生减法溢出（可以通过构造升序序列观察到这一行为）
                Self::quick_sort(&mut nums[left..pivot]);
                // 剩余未排序区间为 [pivot + 1, right]
                left = pivot + 1;
            } else {
                // 递归排序右子数组 [pivot + 1, right]
                Self::quick_sort(&mut nums[(pivot + 1)..=right]);
                // 剩余未排序区间为 [left, pivot - 1]
                // 如果 pivot == 0，则 left == 0，不会进入此分支，
                // 所以，此处不会发生减法溢出
                right = pivot - 1;
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* 快速排序 */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(&mut nums);
    println!("快速排序完成后 nums = {nums:?}");

    /* 快速排序（中位基准数优化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(&mut nums);
    println!("快速排序（中位基准数优化）完成后 nums = {nums:?}");

    /* 快速排序（递归深度优化） */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(&mut nums);
    println!("快速排序（递归深度优化）完成后 nums = {nums:?}");
}
