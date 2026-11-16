/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* 실행 코드 */
fn main() {
    // [region]{init_list}
    // 리스트 초기화
    // 초깃값 없음
    let empty_nums: Vec<i32> = Vec::new();
    // 초깃값 있음
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    // [endregion]{init_list}
    print!("리스트 nums = ");
    print_util::print_array(&nums);
    print!("\n리스트 empty_nums = ");
    print_util::print_array(&empty_nums);

    // [region]{access_element}
    // 원소 접근
    let num = nums[1]; // 인덱스 1의 원소에 접근한다
    // [endregion]{access_element}
    println!("\n인덱스 1의 원소에 접근하여 얻은 num = {num}");

    // [region]{update_element}
    // 원소 갱신
    nums[1] = 0; // 인덱스 1의 원소를 0으로 갱신한다
    // [endregion]{update_element}
    print!("인덱스 1의 원소를 0으로 갱신한 후 nums = ");
    print_util::print_array(&nums);

    // [region]{clear_list}
    // 리스트 비우기
    nums.clear();
    // [endregion]{clear_list}
    print!("\n리스트를 비운 후 nums = ");
    print_util::print_array(&nums);

    // [region]{append_element}
    // 맨 뒤에 원소 추가
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    // [endregion]{append_element}
    print!("\n원소를 추가한 후 nums = ");
    print_util::print_array(&nums);

    // [region]{insert_element}
    // 중간에 원소 삽입
    nums.insert(3, 6); // 인덱스 3에 숫자 6을 삽입한다
    // [endregion]{insert_element}
    print!("\n인덱스 3에 숫자 6을 삽입한 후 nums = ");
    print_util::print_array(&nums);

    // [region]{remove_element}
    // 원소 삭제
    nums.remove(3); // 인덱스 3의 원소를 삭제한다
    // [endregion]{remove_element}
    print!("\n인덱스 3의 원소를 삭제한 후 nums = ");
    print_util::print_array(&nums);

    // [region]{iterate_list}
    // 인덱스를 통해 리스트를 순회한다
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // 리스트의 원소를 직접 순회한다
    _count = 0;
    for x in &nums {
        _count += x;
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    // 두 리스트 연결
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append는 nums1의 원소를 이동시키므로 이후 nums1은 비게 된다
    // [endregion]{concat_list}

    // nums.extend(&nums1);   // extend는 nums1을 빌리기만 하므로 이후에도 nums1을 계속 사용할 수 있다
    print!("\n리스트 nums1을 nums 뒤에 연결한 후 nums = ");
    print_util::print_array(&nums);

    // [region]{sort_list}
    // 리스트 정렬
    nums.sort(); // 정렬 후 리스트 원소는 작은 값부터 큰 값 순서로 나열된다
    // [endregion]{sort_list}
    print!("\n리스트를 정렬한 후 nums = ");
    print_util::print_array(&nums);
}
