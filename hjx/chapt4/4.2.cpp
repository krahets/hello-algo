#include <iostream>

using namespace std;

template <typename T>
class ListNode;

// void ergodic_list(ListNode<T>* list);
template <typename T>
void ergodic_list(T* _list);

template <typename T>
class ListNode {
public:
    ListNode(T value)
        : _value(value)
    {
        next = nullptr;
    };
    ListNode* next;
    // template <typename T>
    // friend void ergodic_list(ListNode<T>* _list);//error
    friend void ergodic_list<>(ListNode<T>* _list); //OK
    // friend void ergodic_list<ListNode<T>>(ListNode<T>* _list); //OK,but void ergodic_list(ListNode<T>* list);error

private:
    T _value;
};

template <typename T>
// void ergodic_list(ListNode<T>* _list)
void ergodic_list(T* _list)
{
    T* current = _list;
    while (current != nullptr) {
        std::cout << current->_value << " ";
        current = current->next;
    }
    std::cout << std::endl;
}

int main(int argc, char** argv)
{
    ListNode<int>* no0 = new ListNode<int>(1);
    ListNode<int>* no1 = new ListNode<int>(3);
    ListNode<int>* no2 = new ListNode<int>(2);
    ListNode<int>* no3 = new ListNode<int>(5);
    ListNode<int>* no4 = new ListNode<int>(4);

    no0->next = no1;
    no1->next = no2;
    no2->next = no3;
    no3->next = no4;
    ergodic_list(no0);
    delete no0;
    delete no1;
    delete no2;
    delete no3;
    delete no4;

    return 0;
}