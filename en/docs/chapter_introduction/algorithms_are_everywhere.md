# Algorithms are everywhere

When we hear the word “algorithm,” we naturally think of mathematics. In fact, many algorithms do not involve complex mathematics. Instead, they rely on basic logic that we encounter throughout everyday life.

Before we formally explore algorithms, here is an interesting fact: **you have already learned many algorithms without realizing it, and you routinely use them in everyday life**. The following examples illustrate this point.

**Example 1: Looking up a word in a dictionary**. In a Chinese dictionary, each character has a corresponding pinyin pronunciation, and entries are arranged alphabetically by pinyin. Suppose we want to find a character whose pinyin begins with $r$. We would usually follow the process shown in the figure below.

1. Open the dictionary roughly halfway through and check the initial letter on that page. Suppose it is $m$.
2. Since $r$ comes after $m$ in the pinyin alphabet, rule out the first half of the dictionary and narrow the search to the second half.
3. Repeat steps `1.` and `2.` until you find the pages whose pinyin entries begin with $r$.

=== "<1>"
    ![Steps for looking up a word in a dictionary](algorithms_are_everywhere.assets/binary_search_dictionary_step1.png)

=== "<2>"
    ![binary_search_dictionary_step2](algorithms_are_everywhere.assets/binary_search_dictionary_step2.png)

=== "<3>"
    ![binary_search_dictionary_step3](algorithms_are_everywhere.assets/binary_search_dictionary_step3.png)

=== "<4>"
    ![binary_search_dictionary_step4](algorithms_are_everywhere.assets/binary_search_dictionary_step4.png)

=== "<5>"
    ![binary_search_dictionary_step5](algorithms_are_everywhere.assets/binary_search_dictionary_step5.png)

This dictionary skill, learned in elementary school, is actually the well-known “binary search” algorithm. From a data structure perspective, we can view the dictionary as a sorted “array”; from an algorithm perspective, the sequence of lookup operations above is “binary search.”

**Example 2: Arranging playing cards**. When playing cards, we need to arrange our hand from smallest to largest each round. The process is shown in the figure below.

1. Divide the cards into “sorted” and “unsorted” sections, initially treating the single leftmost card as sorted.
2. Take a card from the unsorted section and insert it into the correct position in the sorted section. The two leftmost cards are now sorted.
3. Repeat step `2.`, inserting one card from the unsorted section into the sorted section each round, until all the cards are sorted.

![Steps for sorting playing cards](algorithms_are_everywhere.assets/playing_cards_sorting.png)

This method of arranging playing cards is essentially “insertion sort,” an algorithm that is very efficient for small datasets. Insertion sort appears in the library sorting functions of many programming languages.

**Example 3: Making change**. Suppose we buy goods costing $69$ yuan at a supermarket and pay the cashier $100$ yuan. The cashier needs to give us $31$ yuan in change and naturally reasons through the process shown in the figure below.

1. The available denominations smaller than $31$ yuan are $1$, $5$, $10$, and $20$ yuan.
2. Take the largest available denomination, $20$ yuan, leaving $31 - 20 = 11$ yuan.
3. Take the largest denomination that fits the remaining amount, $10$ yuan, leaving $11 - 10 = 1$ yuan.
4. Take the largest denomination that fits the remaining amount, $1$ yuan, leaving $1 - 1 = 0$ yuan.
5. The change is complete: $20 + 10 + 1 = 31$ yuan.

![The process of making change](algorithms_are_everywhere.assets/greedy_change.png)

At each step above, we make the choice that looks best at the moment—using the largest possible denomination—and eventually obtain a valid way to make change. In terms of data structures and algorithms, this is a “greedy” algorithm.

From cooking a meal to traveling between stars, solving almost any problem involves algorithms. Computers allow us to store data structures in memory through programming and write code that calls on CPUs and GPUs to execute algorithms. We can therefore bring real-world problems to computers and solve complex problems more efficiently.

!!! tip

    If concepts such as data structures, algorithms, arrays, and binary search still seem unclear, keep reading. This book will guide you into the world of data structures and algorithms.
