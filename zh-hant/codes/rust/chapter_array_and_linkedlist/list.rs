/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Driver Code */
fn main() {
    // [region]{init_list}
    // 初始化串列
    // 無初始值
    let empty_nums: Vec<i32> = Vec::new();
    // 有初始值
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    // [endregion]{init_list}
    print!("串列 nums = ");
    print_util::print_array(&nums);
    print!("\n串列 empty_nums = ");
    print_util::print_array(&empty_nums);

    // [region]{access_element}
    // 訪問元素
    let num = nums[1]; // 訪問索引 1 處的元素
    // [endregion]{access_element}
    println!("\n訪問索引 1 處的元素，得到 num = {num}");

    // [region]{update_element}
    // 更新元素
    nums[1] = 0; // 將索引 1 處的元素更新為 0
    // [endregion]{update_element}
    print!("將索引 1 處的元素更新為 0 ，得到 nums = ");
    print_util::print_array(&nums);

    // [region]{clear_list}
    // 清空串列
    nums.clear();
    // [endregion]{clear_list}
    print!("\n清空串列後 nums = ");
    print_util::print_array(&nums);

    // [region]{append_element}
    // 在尾部新增元素
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    // [endregion]{append_element}
    print!("\n新增元素後 nums = ");
    print_util::print_array(&nums);

    // [region]{insert_element}
    // 在中間插入元素
    nums.insert(3, 6); // 在索引 3 處插入數字 6
    // [endregion]{insert_element}
    print!("\n在索引 3 處插入數字 6 ，得到 nums = ");
    print_util::print_array(&nums);

    // [region]{remove_element}
    // 刪除元素
    nums.remove(3); // 刪除索引 3 處的元素
    // [endregion]{remove_element}
    print!("\n刪除索引 3 處的元素，得到 nums = ");
    print_util::print_array(&nums);

    // [region]{iterate_list}
    // 透過索引走訪串列
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // 直接走訪串列元素
    _count = 0;
    for x in &nums {
        _count += x;
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    // 拼接兩個串列
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append 會移走 nums1 的元素，之後 nums1 為空
    // [endregion]{concat_list}

    // nums.extend(&nums1);   // extend 只借用 nums1，之後 nums1 仍可繼續使用
    print!("\n將串列 nums1 拼接到 nums 之後，得到 nums = ");
    print_util::print_array(&nums);

    // [region]{sort_list}
    // 排序串列
    nums.sort(); // 排序後，串列元素從小到大排列
    // [endregion]{sort_list}
    print!("\n排序串列後 nums = ");
    print_util::print_array(&nums);
}
