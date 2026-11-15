/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Driver code */
fn main() {
    // Initialize the list
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("List nums = ");
    print_util::print_array(&nums);

    // [region]{access_element}
    // Access an element
    let num = nums[1]; // Access the element at index 1
    // [endregion]{access_element}
    println!("\nAccessing the element at index 1 gives num = {num}");

    // [region]{update_element}
    // Update an element
    nums[1] = 0; // Update the element at index 1 to 0
    // [endregion]{update_element}
    print!("Update the element at index 1 to 0, giving nums = ");
    print_util::print_array(&nums);

    // [region]{clear_list}
    // Clear the list
    nums.clear();
    // [endregion]{clear_list}
    print!("\nAfter clearing the list, nums = ");
    print_util::print_array(&nums);

    // [region]{append_element}
    // Append an element at the end
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    // [endregion]{append_element}
    print!("\nAfter adding elements, nums = ");
    print_util::print_array(&nums);

    // [region]{insert_element}
    // Insert an element in the middle
    nums.insert(3, 6); // Insert the number 6 at index 3
    // [endregion]{insert_element}
    print!("\nInsert the number 6 at index 3, giving nums = ");
    print_util::print_array(&nums);

    // [region]{remove_element}
    // Remove an element
    nums.remove(3); // Remove the element at index 3
    // [endregion]{remove_element}
    print!("\nRemove the element at index 3, giving nums = ");
    print_util::print_array(&nums);

    // [region]{iterate_list}
    // Traverse the list by index
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // Iterate directly over the list elements
    _count = 0;
    for x in &nums {
        _count += x;
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    // Concatenate two lists
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append moves the elements, leaving nums1 empty!
    // [endregion]{concat_list}

    // nums.extend(&nums1);   // extend borrows nums1, leaving its elements available
    print!("\nAppend list nums1 to nums, giving nums = ");
    print_util::print_array(&nums);

    // [region]{sort_list}
    // Sort the list
    nums.sort(); // After sorting, the list elements are in ascending order
    // [endregion]{sort_list}
    print!("\nAfter sorting the list, nums = ");
    print_util::print_array(&nums);
}
