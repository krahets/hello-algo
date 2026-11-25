# Lists

A <u>list</u> is an abstract data structure representing an ordered collection of elements. It supports access, updates, insertion, removal, and traversal without requiring the user to manage capacity limits. A list can be implemented with a linked list or an array.

- A linked list naturally serves as a list: we can insert, remove, find, and update elements, and it can grow dynamically as needed.
- An array also supports insertion, removal, lookup, and updates. Its fixed length, however, makes it a list with a length limit.

When a list is backed by an array, **the array's fixed length makes the list less practical**. We usually do not know in advance how much data we will store, so choosing a suitable length is difficult. Too short, and the list may not meet our needs. Too long, and it wastes memory.

We can solve this problem by implementing the list with a <u>dynamic array</u>. It preserves the advantages of an array and can grow while the program is running.

In fact, **many programming languages provide lists backed by dynamic arrays in their standard libraries**. Examples include Python's `list`, Java's `ArrayList`, C++'s `vector`, and C#'s `List`. In the discussion that follows, we use “list” and “dynamic array” interchangeably.

## Common list operations

### Initializing a list

We generally initialize a list in one of two ways: with or without initial values.

```snippet
init_list
```

??? pythontutor "Visualize execution"

    @tutor init_list_tutor

### Accessing an element

Because the list is backed by an array, accessing or updating an element is efficient and takes $O(1)$ time.

```snippet
access_element
```

??? pythontutor "Visualize execution"

    @tutor access_element_tutor

### Inserting and removing elements

Unlike a fixed-length array, a list lets us add or remove elements freely. Appending an element takes $O(1)$ time amortized, while insertion and removal still have the same $O(n)$ time complexity as in an array.

```snippet
insert_remove_element
```

??? pythontutor "Visualize execution"

    @tutor insert_remove_element_tutor

### Traversing a list

As with an array, we can traverse a list by index or iterate directly over its elements.

```snippet
iterate_list
```

??? pythontutor "Visualize execution"

    @tutor iterate_list_tutor

### Concatenating lists

Given another list `nums1`, we can append its contents to the end of the original list.

```snippet
concat_list
```

??? pythontutor "Visualize execution"

    @tutor concat_list_tutor

### Sorting a list

Once we sort a list, we can apply binary search and two-pointer algorithms, both common in array problems.

```snippet
sort_list
```

??? pythontutor "Visualize execution"

    @tutor sort_list_tutor

## Implementing a list

Many languages, including Java, C++, and Python, provide lists. Their implementations are complex and their parameters, such as initial capacity and growth factor, are carefully chosen. You can explore these choices in the source code.

To see how a list works, let's implement a simple one. The design has three main parts.

- **Initial capacity.** Choose a reasonable initial capacity for the array. In this example, we use 10.
- **Element count.** Declare a variable `size` to track the current number of elements and update it whenever an element is inserted or removed. It tells us where the list ends and whether the array needs to grow.
- **Capacity growth.** If the list is full when we insert an element, it needs more space. Create a larger array using the growth factor and move all current elements into it in order. In this example, we double the capacity each time.

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
