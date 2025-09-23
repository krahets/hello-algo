/**
 * File: print_utils.hpp
 * Created Time: 2021-12-19
 * Author: krahets (krahets@163.com), msk397 (machangxinq@gmail.com), LoneRanger(836253168@qq.com)
 */

#pragma once

#include "list_node.hpp"
#include "tree_node.hpp"
#include <climits>
#include <iostream>
#include <sstream>
#include <string>

/* ベクター内の要素を検索する */
template <typename T> int vecFind(const vector<T> &vec, T ele) {
    int j = INT_MAX;
    for (int i = 0; i < vec.size(); i++) {
        if (vec[i] == ele) {
            j = i;
        }
    }
    return j;
}

/* ベクターを区切り文字で連結する */
template <typename T> string strJoin(const string &delim, const T &vec) {
    ostringstream s;
    for (const auto &i : vec) {
        if (&i != &vec[0]) {
            s << delim;
        }
        s << i;
    }
    return s.str();
}

/* 文字列をn回繰り返す */
string strRepeat(string str, int n) {
    ostringstream os;
    for (int i = 0; i < n; i++)
        os << str;
    return os.str();
}

/* 配列を印刷する */
template <typename T> void printArray(T *arr, int n) {
    cout << "[";
    for (int i = 0; i < n - 1; i++) {
        cout << arr[i] << ", ";
    }
    if (n >= 1)
        cout << arr[n - 1] << "]" << endl;
    else
        cout << "]" << endl;
}

/* ベクター文字列オブジェクトを取得する */
template <typename T> string getVectorString(vector<T> &list) {
    return "[" + strJoin(", ", list) + "]";
}

/* リストを印刷する */
template <typename T> void printVector(vector<T> list) {
    cout << getVectorString(list) << '\n';
}

/* 行列を印刷する */
template <typename T> void printVectorMatrix(vector<vector<T>> &matrix) {
    cout << "[" << '\n';
    for (vector<T> &list : matrix)
        cout << "  " + getVectorString(list) + "," << '\n';
    cout << "]" << '\n';
}

/* 連結リストを印刷する */
void printLinkedList(ListNode *head) {
    vector<int> list;
    while (head != nullptr) {
        list.push_back(head->val);
        head = head->next;
    }

    cout << strJoin(" -> ", list) << '\n';
}

struct Trunk {
    Trunk *prev;
    string str;
    Trunk(Trunk *prev, string str) {
        this->prev = prev;
        this->str = str;
    }
};

void showTrunks(Trunk *p) {
    if (p == nullptr) {
        return;
    }

    showTrunks(p->prev);
    cout << p->str;
}

/**
 * 二分木を印刷する
 * この木プリンターはTECHIE DELIGHTから借用しました
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
void printTree(TreeNode *root, Trunk *prev, bool isRight) {
    if (root == nullptr) {
        return;
    }

    string prev_str = "    ";
    Trunk trunk(prev, prev_str);

    printTree(root->right, &trunk, true);

    if (!prev) {
        trunk.str = "———";
    } else if (isRight) {
        trunk.str = "/———";
        prev_str = "   |";
    } else {
        trunk.str = "\\———";
        prev->str = prev_str;
    }

    showTrunks(&trunk);
    cout << " " << root->val << endl;

    if (prev) {
        prev->str = prev_str;
    }
    trunk.str = "   |";

    printTree(root->left, &trunk, false);
}

/* 二分木を印刷する */
void printTree(TreeNode *root) {
    printTree(root, nullptr, false);
}

/* スタックを印刷する */
template <typename T> void printStack(stack<T> stk) {
    // 入力スタックを逆順にする
    stack<T> tmp;
    while (!stk.empty()) {
        tmp.push(stk.top());
        stk.pop();
    }
    // 印刷する文字列を生成
    ostringstream s;
    bool flag = true;
    while (!tmp.empty()) {
        if (flag) {
            s << tmp.top();
            flag = false;
        } else
            s << ", " << tmp.top();
        tmp.pop();
    }
    cout << "[" + s.str() + "]" << '\n';
}

/* キューを印刷する */
template <typename T> void printQueue(queue<T> queue) {
    // 印刷する文字列を生成
    ostringstream s;
    bool flag = true;
    while (!queue.empty()) {
        if (flag) {
            s << queue.front();
            flag = false;
        } else
            s << ", " << queue.front();
        queue.pop();
    }
    cout << "[" + s.str() + "]" << '\n';
}

/* デックを印刷する */
template <typename T> void printDeque(deque<T> deque) {
    // 印刷する文字列を生成
    ostringstream s;
    bool flag = true;
    while (!deque.empty()) {
        if (flag) {
            s << deque.front();
            flag = false;
        } else
            s << ", " << deque.front();
        deque.pop_front();
    }
    cout << "[" + s.str() + "]" << '\n';
}

/* ハッシュテーブルを印刷する */
// キー値ペアの型を指定するためにテンプレートパラメータTKeyとTValueを定義
template <typename TKey, typename TValue> void printHashMap(unordered_map<TKey, TValue> map) {
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << '\n';
    }
}

/* priority_queueコンテナの基礎となるストレージを公開する */
template <typename T, typename S, typename C> S &Container(priority_queue<T, S, C> &pq) {
    struct HackedQueue : private priority_queue<T, S, C> {
        static S &Container(priority_queue<T, S, C> &pq) {
            return pq.*&HackedQueue::c;
        }
    };
    return HackedQueue::Container(pq);
}

/* ヒープ（優先度付きキュー）を印刷する */
template <typename T, typename S, typename C> void printHeap(priority_queue<T, S, C> &heap) {
    vector<T> vec = Container(heap);
    cout << "ヒープの配列表現:";
    printVector(vec);
    cout << "ヒープの木表現:" << endl;
    TreeNode *root = vectorToTree(vec);
    printTree(root);
    freeMemoryTree(root);
}