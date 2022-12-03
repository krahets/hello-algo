/*
 * File: avl_tree.cpp
 * Created Time: 2022-12-2
 * Author: mgisr (maguagua0706@gmail.com)
 */

#include "../include/include.hpp"

class AvlTree {
private:
    TreeNode *root{};
    static bool isBalance(const TreeNode *p);
    static int getBalanceFactor(const TreeNode *p);
    static void updateHeight(TreeNode *p);
    void fixBalance(TreeNode *p);
    static bool isLeftChild(const TreeNode *p);
    static TreeNode *&fromParentTo(TreeNode *node);
public:
    AvlTree() = default;
    AvlTree(const AvlTree &p) = default;
    const TreeNode *search(int val);
    bool insert(int val);
    bool remove(int val);
    void printTree();
};

// 判断该结点是否平衡
bool AvlTree::isBalance(const TreeNode *p) {
    int balance_factor = getBalanceFactor(p);
    if (-1 <= balance_factor && balance_factor <= 1) { return true; }
    else { return false; }
}

// 获取当前结点的平衡因子
int AvlTree::getBalanceFactor(const TreeNode *p) {
    if (p->left == nullptr && p->right == nullptr) { return 0; }
    else if (p->left == nullptr) { return (-p->right->height); }
    else if (p->right == nullptr) { return p->left->height; }
    else { return p->left->height - p->right->height; }
}

// 更新结点高度
void AvlTree::updateHeight(TreeNode *p) {
    if (p->left == nullptr && p->right == nullptr) { p->height = 1; }
    else if (p->left == nullptr) { p->height = p->right->height + 1; }
    else if (p->right == nullptr) { p->height = p->left->height + 1; }
    else { p->height = std::max(p->left->height, p->right->height) + 1; }
}

void AvlTree::fixBalance(TreeNode *p) {
    // 左旋操作
    auto rotate_left = [&](TreeNode *node) -> TreeNode * {
        TreeNode *temp = node->right;
        temp->parent = p->parent;
        node->right = temp->left;
        if (temp->left != nullptr) {
            temp->left->parent = node;
        }
        temp->left = node;
        node->parent = temp;
        updateHeight(node);
        updateHeight(temp);
        return temp;
    };
    // 右旋操作
    auto rotate_right = [&](TreeNode *node) -> TreeNode * {
        TreeNode *temp = node->left;
        temp->parent = p->parent;
        node->left = temp->right;
        if (temp->right != nullptr) {
            temp->right->parent = node;
        }
        temp->right = node;
        node->parent = temp;
        updateHeight(node);
        updateHeight(temp);
        return temp;
    };
    // 根据规则选取旋转方式
    if (getBalanceFactor(p) > 1) {
        if (getBalanceFactor(p->left) > 0) {
            if (p->parent == nullptr) { root = rotate_right(p); }
            else { fromParentTo(p) = rotate_right(p); }
        } else {
            p->left = rotate_left(p->left);
            if (p->parent == nullptr) { root = rotate_right(p); }
            else { fromParentTo(p) = rotate_right(p); }
        }
    } else {
        if (getBalanceFactor(p->right) < 0) {
            if (p->parent == nullptr) { root = rotate_left(p); }
            else { fromParentTo(p) = rotate_left(p); }
        } else {
            p->right = rotate_right(p->right);
            if (p->parent == nullptr) { root = rotate_left(p); }
            else { fromParentTo(p) = rotate_left(p); }
        }
    }
}

// 判断当前结点是否为其父节点的左孩子
bool AvlTree::isLeftChild(const TreeNode *p) {
    if (p->parent == nullptr) { return false; }
    return (p->parent->left == p);
}

// 返回父节点指向当前结点指针的引用
TreeNode *&AvlTree::fromParentTo(TreeNode *node) {
    if (isLeftChild(node)) { return node->parent->left; }
    else { return node->parent->right; }
}

const TreeNode *AvlTree::search(int val) {
    TreeNode *p = root;
    while (p != nullptr) {
        if (p->val == val) { return p; }
        else if (p->val > val) { p = p->left; }
        else { p = p->right; }
    }
    return nullptr;
}

bool AvlTree::insert(int val) {
    TreeNode *p = root;
    if (p == nullptr) {
        root = new TreeNode(val);
        return true;
    }
    for (;;) {
        if (p->val == val) { return false; }
        else if (p->val > val) {
            if (p->left == nullptr) {
                p->left = new TreeNode(val, p);
                break;
            } else {
                p = p->left;
            }
        } else {
            if (p->right == nullptr) {
                p->right = new TreeNode(val, p);
                break;
            } else {
                p = p->right;
            }
        }
    }
    for (; p != nullptr; p = p->parent) {
        if (!isBalance(p)) {
            fixBalance(p);
            break;
        } else { updateHeight(p); }
    }
    return true;
}

bool AvlTree::remove(int val) {
    TreeNode *p = root;
    if (p == nullptr) { return false; }
    while (p != nullptr) {
        if (p->val == val) {
            TreeNode *real_delete_node = p;
            TreeNode *next_node;
            if (p->left == nullptr) {
                next_node = p->right;
                if (p->parent == nullptr) { root = next_node; }
                else { fromParentTo(p) = next_node; }
            } else if (p->right == nullptr) {
                next_node = p->left;
                if (p->parent == nullptr) { root = next_node; }
                else { fromParentTo(p) = next_node; }
            } else {
                while (real_delete_node->left != nullptr) {
                    real_delete_node = real_delete_node->left;
                }
                std::swap(p->val, real_delete_node->val);
                next_node = real_delete_node->right;
                if (real_delete_node->parent == p) { p->right = next_node; }
                else { real_delete_node->parent->left = next_node; }
            }
            if (next_node != nullptr) {
                next_node->parent = real_delete_node->parent;
            }
            for (p = real_delete_node; p != nullptr; p = p->parent) {
                if (!isBalance(p)) { fixBalance(p); }
                updateHeight(p);
            }
            delete real_delete_node;
            return true;
        } else if (p->val > val) {
            p = p->left;
        } else {
            p = p->right;
        }
    }
    return false;
}

void inOrder(const TreeNode *root) {
    if (root == nullptr) return;
    inOrder(root->left);
    cout << root->val << ' ';
    inOrder(root->right);
}

void AvlTree::printTree() {
    inOrder(root);
    cout << endl;
}

int main() {
    AvlTree tree = AvlTree();
    // tree.insert(13);
    // tree.insert(24);
    // tree.insert(37);
    // tree.insert(90);
    // tree.insert(53);

    tree.insert(53);
    tree.insert(90);
    tree.insert(37);
    tree.insert(24);
    tree.insert(13);
    tree.remove(90);
    tree.printTree();
    const TreeNode *p = tree.search(37);
    cout << p->val;
    return 0;
}