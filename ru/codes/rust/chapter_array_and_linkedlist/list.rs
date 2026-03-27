/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Driver Code */
fn main() {
    // Инициализировать список
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("Список nums = ");
    print_util::print_array(&nums);

    // Получить доступ к элементу
    let num = nums[1];
    println!("\nобратиться киндекс 1 поэлемент, получаем num = {num}");

    // Обновить элемент
    nums[1] = 0;
    print!("После обновления элемента по индексу 1 на 0 получаем nums = ");
    print_util::print_array(&nums);

    // Очистить список
    nums.clear();
    print!("\nПосле очистки списка nums = ");
    print_util::print_array(&nums);

    // Добавить элемент в конец
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\nДобавитьэлементпосле nums =");
    print_util::print_array(&nums);

    // Вставить элемент в середину
    nums.insert(3, 6);
    print!("\nПосле вставки числа 6 по индексу 3 получаем nums =");
    print_util::print_array(&nums);

    // Удалить элемент
    nums.remove(3);
    print!("\nУдалитьиндекс 3 поэлемент, получаем nums =");
    print_util::print_array(&nums);

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

    // Объединить два списка
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // После append (перемещение) nums1 становится пустым!

    // nums.extend(&nums1);   // extend (заимствование), nums1 можно продолжать использовать
    print!("\nПосле присоединения списка nums1 к nums получаем nums =");
    print_util::print_array(&nums);

    // Отсортировать список
    nums.sort();
    print!("\nПосле сортировки списка nums = ");
    print_util::print_array(&nums);
}
