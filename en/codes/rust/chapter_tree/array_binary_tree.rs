/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, tree_node};

/* Binary tree type using an array representation */
struct ArrayBinaryTree {
    tree: Vec<Option<i32>>,
}

impl ArrayBinaryTree {
    /* Constructor */
    fn new(arr: Vec<Option<i32>>) -> Self {
        Self { tree: arr }
    }

    /* Number of positions in the array */
    fn size(&self) -> i32 {
        self.tree.len() as i32
    }

    /* Get the value of the node at index i */
    fn val(&self, i: i32) -> Option<i32> {
        // If the index is out of bounds, return None to represent an empty position
        if i < 0 || i >= self.size() {
            None
        } else {
            self.tree[i as usize]
        }
    }

    /* Get the left child index of the node at index i */
    fn left(&self, i: i32) -> i32 {
        2 * i + 1
    }

    /* Get the right child index of the node at index i */
    fn right(&self, i: i32) -> i32 {
        2 * i + 2
    }

    /* Get the parent index of the node at index i */
    fn parent(&self, i: i32) -> i32 {
        (i - 1) / 2
    }

    /* Level-order traversal */
    fn level_order(&self) -> Vec<i32> {
        self.tree.iter().filter_map(|&x| x).collect()
    }

    /* Depth-first traversal */
    fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
        if self.val(i).is_none() {
            return;
        }
        let val = self.val(i).unwrap();
        // Preorder traversal
        if order == "pre" {
            res.push(val);
        }
        self.dfs(self.left(i), order, res);
        // Inorder traversal
        if order == "in" {
            res.push(val);
        }
        self.dfs(self.right(i), order, res);
        // Postorder traversal
        if order == "post" {
            res.push(val);
        }
    }

    /* Preorder traversal */
    fn pre_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "pre", &mut res);
        res
    }

    /* Inorder traversal */
    fn in_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "in", &mut res);
        res
    }

    /* Postorder traversal */
    fn post_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "post", &mut res);
        res
    }
}

/* Driver code */
fn main() {
    // Initialize the binary tree
    // Use a helper function that builds a binary tree directly from an array
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
    println!("\nInitialize the binary tree\n");
    println!("Array representation of the binary tree:");
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
    println!("Linked representation of the binary tree:");
    print_util::print_tree(&root);

    // Binary tree type using an array representation
    let abt = ArrayBinaryTree::new(arr);

    // Access a node
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!(
        "\nCurrent node index: {}, value: {}",
        i,
        if let Some(val) = abt.val(i) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Left child index: {}, value: {}",
        l,
        if let Some(val) = abt.val(l) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Right child index: {}, value: {}",
        r,
        if let Some(val) = abt.val(r) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Parent index: {}, value: {}",
        p,
        if let Some(val) = abt.val(p) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );

    // Traverse the tree
    let mut res = abt.level_order();
    println!("\nLevel-order traversal: {:?}", res);
    res = abt.pre_order();
    println!("Preorder traversal: {:?}", res);
    res = abt.in_order();
    println!("Inorder traversal: {:?}", res);
    res = abt.post_order();
    println!("Postorder traversal: {:?}", res);
}
