/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Driver Code */
fn main() {
    // 初始化列表
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("列表 nums = ");
    print_util::print_array(&nums);

    // [region]{access_element}
    // 访问元素
    let num = nums[1]; // 访问索引 1 处的元素
    // [endregion]{access_element}
    println!("\n访问索引 1 处的元素，得到 num = {num}");

    // [region]{update_element}
    // 更新元素
    nums[1] = 0; // 将索引 1 处的元素更新为 0
    // [endregion]{update_element}
    print!("将索引 1 处的元素更新为 0 ，得到 nums = ");
    print_util::print_array(&nums);

    // [region]{clear_list}
    // 清空列表
    nums.clear();
    // [endregion]{clear_list}
    print!("\n清空列表后 nums = ");
    print_util::print_array(&nums);

    // [region]{append_element}
    // 在尾部添加元素
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    // [endregion]{append_element}
    print!("\n添加元素后 nums = ");
    print_util::print_array(&nums);

    // [region]{insert_element}
    // 在中间插入元素
    nums.insert(3, 6); // 在索引 3 处插入数字 6
    // [endregion]{insert_element}
    print!("\n在索引 3 处插入数字 6 ，得到 nums = ");
    print_util::print_array(&nums);

    // [region]{remove_element}
    // 删除元素
    nums.remove(3); // 删除索引 3 处的元素
    // [endregion]{remove_element}
    print!("\n删除索引 3 处的元素，得到 nums = ");
    print_util::print_array(&nums);

    // [region]{iterate_list}
    // 通过索引遍历列表
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // 直接遍历列表元素
    _count = 0;
    for x in &nums {
        _count += x;
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    // 拼接两个列表
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append（移动） 之后 nums1 为空！
    // [endregion]{concat_list}

    // nums.extend(&nums1);   // extend（借用） nums1 能继续使用
    print!("\n将列表 nums1 拼接到 nums 之后，得到 nums = ");
    print_util::print_array(&nums);

    // [region]{sort_list}
    // 排序列表
    nums.sort(); // 排序后，列表元素从小到大排列
    // [endregion]{sort_list}
    print!("\n排序列表后 nums = ");
    print_util::print_array(&nums);
}
