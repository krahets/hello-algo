/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, tree_node};

/* Класс двоичного дерева на основе массива */
struct ArrayBinaryTree {
    tree: Vec<Option<i32>>,
}

impl ArrayBinaryTree {
    /* Конструктор */
    fn new(arr: Vec<Option<i32>>) -> Self {
        Self { tree: arr }
    }

    /* Ёмкость списка */
    fn size(&self) -> i32 {
        self.tree.len() as i32
    }

    /* Получить значение узла с индексом i */
    fn val(&self, i: i32) -> Option<i32> {
        // Если индекс выходит за границы массива, вернуть None — признак пустой позиции
        if i < 0 || i >= self.size() {
            None
        } else {
            self.tree[i as usize]
        }
    }

    /* Получить индекс левого потомка узла с индексом i */
    fn left(&self, i: i32) -> i32 {
        2 * i + 1
    }

    /* Получить индекс правого потомка узла с индексом i */
    fn right(&self, i: i32) -> i32 {
        2 * i + 2
    }

    /* Получить индекс родителя узла с индексом i */
    fn parent(&self, i: i32) -> i32 {
        (i - 1) / 2
    }

    /* Обход по уровням */
    fn level_order(&self) -> Vec<i32> {
        self.tree.iter().filter_map(|&x| x).collect()
    }

    /* Обход в глубину */
    fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
        if self.val(i).is_none() {
            return;
        }
        let val = self.val(i).unwrap();
        // Прямой обход
        if order == "pre" {
            res.push(val);
        }
        self.dfs(self.left(i), order, res);
        // Симметричный обход
        if order == "in" {
            res.push(val);
        }
        self.dfs(self.right(i), order, res);
        // Обратный обход
        if order == "post" {
            res.push(val);
        }
    }

    /* Прямой обход */
    fn pre_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "pre", &mut res);
        res
    }

    /* Симметричный обход */
    fn in_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "in", &mut res);
        res
    }

    /* Обратный обход */
    fn post_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "post", &mut res);
        res
    }
}

/* Основная программа */
fn main() {
    // Инициализация двоичного дерева
    // Используем функцию, которая строит двоичное дерево непосредственно из массива
    let arr = vec![
        Some(1),
        Some(2),
        Some(3),
        Some(4),
        None,
        Some(6),
        Some(7),
        Some(8),
        Some(9),
        None,
        None,
        Some(12),
        None,
        None,
        Some(15),
    ];

    let root = tree_node::vec_to_tree(arr.clone()).unwrap();
    println!("\nИнициализация двоичного дерева\n");
    println!("Двоичное дерево в виде массива:");
    println!(
        "[{}]",
        arr.iter()
            .map(|&val| if let Some(val) = val {
                format!("{val}")
            } else {
                "null".to_string()
            })
            .collect::<Vec<String>>()
            .join(", ")
    );
    println!("Связное представление двоичного дерева:");
    print_util::print_tree(&root);

    // Класс двоичного дерева на основе массива
    let abt = ArrayBinaryTree::new(arr);

    // Доступ к узлу
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!(
        "\nИндекс текущего узла: {}, значение: {}",
        i,
        if let Some(val) = abt.val(i) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Индекс левого потомка: {}, значение: {}",
        l,
        if let Some(val) = abt.val(l) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Индекс правого потомка: {}, значение: {}",
        r,
        if let Some(val) = abt.val(r) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Индекс родителя: {}, значение: {}",
        p,
        if let Some(val) = abt.val(p) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );

    // Обход дерева
    let mut res = abt.level_order();
    println!("\nОбход по уровням: {:?}", res);
    res = abt.pre_order();
    println!("Прямой обход: {:?}", res);
    res = abt.in_order();
    println!("Симметричный обход: {:?}", res);
    res = abt.post_order();
    println!("Обратный обход: {:?}", res);
}
