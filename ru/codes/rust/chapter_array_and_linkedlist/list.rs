/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Driver Code */
fn main() {
    // [region]{init_list}
    // Инициализация списка
    // Без начальных значений
    let empty_nums: Vec<i32> = Vec::new();
    // С начальными значениями
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    // [endregion]{init_list}
    print!("Список nums = ");
    print_util::print_array(&nums);
    print!("\nСписок empty_nums = ");
    print_util::print_array(&empty_nums);

    // [region]{access_element}
    // Доступ к элементу
    let num = nums[1]; // Доступ к элементу по индексу 1
    // [endregion]{access_element}
    println!("\nЭлемент по индексу 1: num = {num}");

    // [region]{update_element}
    // Изменение элемента
    nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
    // [endregion]{update_element}
    print!("После изменения значения элемента с индексом 1 на 0 nums = ");
    print_util::print_array(&nums);

    // [region]{clear_list}
    // Очистить список
    nums.clear();
    // [endregion]{clear_list}
    print!("\nПосле очистки списка nums = ");
    print_util::print_array(&nums);

    // [region]{append_element}
    // Добавление элемента в конец
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    // [endregion]{append_element}
    print!("\nПосле добавления элементов nums = ");
    print_util::print_array(&nums);

    // [region]{insert_element}
    // Вставка элемента в середину
    nums.insert(3, 6); // Вставить число 6 по индексу 3
    // [endregion]{insert_element}
    print!("\nПосле вставки числа 6 по индексу 3 nums = ");
    print_util::print_array(&nums);

    // [region]{remove_element}
    // Удаление элемента
    nums.remove(3); // Удалить элемент по индексу 3
    // [endregion]{remove_element}
    print!("\nПосле удаления элемента по индексу 3 nums = ");
    print_util::print_array(&nums);

    // [region]{iterate_list}
    // Обходить список по индексам
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // Непосредственно обходить элементы списка
    _count = 0;
    for x in &nums {
        _count += x;
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    // Объединить два списка
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append перемещает элементы nums1, после чего nums1 становится пустым
    // [endregion]{concat_list}

    // nums.extend(&nums1);   // extend лишь заимствует nums1, поэтому nums1 можно использовать и дальше
    print!("\nПосле конкатенации списка nums1 к nums nums = ");
    print_util::print_array(&nums);

    // [region]{sort_list}
    // Отсортировать список
    nums.sort(); // После сортировки элементы списка идут по возрастанию
    // [endregion]{sort_list}
    print!("\nПосле сортировки списка nums = ");
    print_util::print_array(&nums);
}
