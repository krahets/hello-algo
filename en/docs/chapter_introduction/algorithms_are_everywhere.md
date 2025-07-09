# Algorithms are everywhere

When we hear the term "algorithm," we naturally think of mathematics. However, many algorithms do not involve complex mathematics but rely more on basic logic, which can be seen everywhere in our daily lives.

Before we start discussing about algorithms officially, there's an interesting fact worth sharing: **you've learned many algorithms unconsciously and are used to applying them in your daily life**. Here, I will give a few specific examples to prove this point.

**Example 1: Looking Up a Dictionary**. In an English dictionary, words are listed alphabetically. Assuming we're searching for a word that starts with the letter $r$, this is typically done in the following way:

1. Open the dictionary to about halfway and check the first vocabulary of the page, let's say the letter starts with $m$.
2. Since $r$ comes after $m$ in the alphabet, the first half can be ignored and the search space is narrowed down to the second half.
3. Repeat steps `1.` and `2.` until you find the page where the word starts with $r$.

=== "<1>"
    ![Process of looking up a dictionary](algorithms_are_everywhere.assets/binary_search_dictionary_step1.png)

=== "<2>"
    ![Binary search in dictionary step 2](algorithms_are_everywhere.assets/binary_search_dictionary_step2.png)

=== "<3>"
    ![Binary search in dictionary step 3](algorithms_are_everywhere.assets/binary_search_dictionary_step3.png)

=== "<4>"
    ![Binary search in dictionary step 4](algorithms_are_everywhere.assets/binary_search_dictionary_step4.png)

=== "<5>"
    ![Binary search in dictionary step 5](algorithms_are_everywhere.assets/binary_search_dictionary_step5.png)

Looking up a dictionary, an essential skill for elementary school students is actually the famous "Binary Search" algorithm. From a data structure perspective, we can consider the dictionary as a sorted "array"; from an algorithmic perspective, the series of actions taken to look up a word in the dictionary can be viewed as the algorithm "Binary Search."

**Example 2: Organizing Card Deck**. When playing cards, we need to arrange the cards in our hands in ascending order, as shown in the following process.

1. Divide the playing cards into "ordered" and "unordered" sections, assuming initially the leftmost card is already in order.
2. Take out a card from the unordered section and insert it into the correct position in the ordered section; after this, the leftmost two cards are in order.
3. Repeat step `2` until all cards are in order.

![Process of sorting a deck of cards](algorithms_are_everywhere.assets/playing_cards_sorting.png)

The above method of organizing playing cards is practically the "Insertion Sort" algorithm, which is very efficient for small datasets. Many programming languages' sorting functions include the insertion sort.

**Example 3: Making Change**. Assume making a purchase of $69$ at a supermarket. If you give the cashier $100$, they will need to provide you with $31$ in change. This process can be clearly understood as illustrated in the figure below.

1. The options are currencies valued below $31$, including $1$, $5$, $10$, and $20$.
2. Take out the largest $20$ from the options, leaving $31 - 20 = 11$.
3. Take out the largest $10$ from the remaining options, leaving $11 - 10 = 1$.
4. Take out the largest $1$ from the remaining options, leaving $1 - 1 = 0$.
5. Complete change-making, the solution is $20 + 10 + 1 = 31$.

![Process of making change](algorithms_are_everywhere.assets/greedy_change.png)

In the steps described, we choose the best option at each stage by utilizing the largest denomination available, which leads to an effective change-making strategy. From a data structures and algorithms perspective, this approach is known as a "Greedy" algorithm.

From cooking a meal to interstellar travel, almost all problem-solving involves algorithms. The advent of computers allows us to store data structures in memory and write code to call the CPU and GPU to execute algorithms. In this way, we can transfer real-life problems to computers and solve various complex issues in a more efficient way.

!!! tip

    If you are still confused about concepts like data structures, algorithms, arrays, and binary searches, I encourage you to keep reading. This book will gently guide you into the realm of understanding data structures and algorithms.
