# Memory and cache *

In the first two sections of this chapter, we explored arrays and linked lists, two fundamental data structures that represent "continuous storage" and "dispersed storage," respectively.

In fact, **the physical structure largely determines how efficiently a program utilizes memory and cache**, which in turn affects the overall performance of the algorithm.

## Computer storage devices

There are three types of storage devices in computers: <u>hard disk</u>, <u>random-access memory (RAM)</u>, and <u>cache memory</u>. The following table shows their respective roles and performance characteristics in computer systems.

<p align="center"> Table <id> &nbsp; Computer storage devices </p>

|            | Hard Disk                                                      | Memory                                                                   | Cache                                                                                           |
| ---------- | -------------------------------------------------------------- | ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| Usage      | Long-term storage of data, including OS, programs, files, etc. | Temporary storage of currently running programs and data being processed | Stores frequently accessed data and instructions, reducing the number of CPU accesses to memory |
| Volatility | Data is not lost after power off                               | Data is lost after power off                                             | Data is lost after power off                                                                    |
| Capacity   | Larger, TB level                                               | Smaller, GB level                                                        | Very small, MB level                                                                            |
| Speed      | Slower, several hundred to thousands MB/s                      | Faster, several tens of GB/s                                             | Very fast, several tens to hundreds of GB/s                                                     |
| Price      | Cheaper, a few cents to a few dollars / GB                            | More expensive, tens to hundreds of dollars / GB                            | Very expensive, priced with CPU                                                                 |

The computer storage system can be visualized as a pyramid, as shown in the figure below. The storage devices at the top of the pyramid are faster, have smaller capacities, and are more expensive. This multi-level design is not accidental, but a deliberate outcome of careful consideration by computer scientists and engineers.

- **Replacing hard disks with memory is challenging**. Firstly, data in memory is lost after power off, making it unsuitable for long-term data storage; secondly, memory is significantly more expensive than hard disks, limiting its feasibility for widespread use in the consumer market.
- **Caches face a trade-off between large capacity and high speed**. As the capacity of L1, L2, and L3 caches increases, their physical size grows, increasing the distance from the CPU core. This results in longer data transfer times and higher access latency. With current technology, a multi-level cache structure provides the optimal balance between capacity, speed, and cost.

![Computer storage system](ram_and_cache.assets/storage_pyramid.png)

!!! tip

    The storage hierarchy in computers reflects a careful balance between speed, capacity, and cost. This type of trade-off is common across various industries, where finding the optimal balance between benefits and limitations is essential.

Overall, **hard disks provide long-term storage for large volumes of data, memory serves as temporary storage for data being processed during program execution, and cache stores frequently accessed data and instructions to enhance execution efficiency**. Together, they ensure the efficient operation of computer systems.

As shown in the figure below, during program execution, data is read from the hard disk into memory for CPU computation. The cache, acting as an extension of the CPU, **intelligently preloads data from memory**, enabling faster data access for the CPU. This greatly improves program execution efficiency while reducing reliance on slower memory.

![Data flow between hard disk, memory, and cache](ram_and_cache.assets/computer_storage_devices.png)

## Memory efficiency of data structures

In terms of memory space utilization, arrays and linked lists have their advantages and limitations.

On one hand, **memory is limited and cannot be shared by multiple programs**, so optimizing space usage in data structures is crucial. Arrays are space-efficient because their elements are tightly packed, without requiring extra memory for references (pointers) as in linked lists. However, arrays require pre-allocating a contiguous block of memory, which can lead to waste if the allocated space exceeds the actual need. Expanding an array also incurs additional time and space overhead. In contrast, linked lists allocate and free memory dynamically for each node, offering greater flexibility at the cost of additional memory for pointers.

On the other hand, during program execution, **repeated memory allocation and deallocation increase memory fragmentation**, reducing memory utilization efficiency. Arrays, due to their continuous storage method, are relatively less likely to cause memory fragmentation. In contrast, linked lists store elements in non-contiguous locations, and frequent insertions and deletions can exacerbate memory fragmentation.

## Cache efficiency of data structures

Although caches are much smaller in space capacity than memory, they are much faster and play a crucial role in program execution speed. Due to their limited capacity, caches can only store a subset of frequently accessed data. When the CPU attempts to access data not present in the cache, a <u>cache miss</u> occurs, requiring the CPU to retrieve the needed data from slower memory, which can impact performance.

Clearly, **the fewer the cache misses, the higher the CPU's data read-write efficiency**, and the better the program performance. The proportion of successful data retrieval from the cache by the CPU is called the <u>cache hit rate</u>, a metric often used to measure cache efficiency.

To achieve higher efficiency, caches adopt the following data loading mechanisms.

- **Cache lines**: Caches operate by storing and loading data in units called cache lines, rather than individual bytes. This approach improves efficiency by transferring larger blocks of data at once.
- **Prefetch mechanism**: Processors predict data access patterns (e.g., sequential or fixed-stride access) and preload data into the cache based on these patterns to increase the cache hit rate.
- **Spatial locality**: When a specific piece of data is accessed, nearby data is likely to be accessed soon. To leverage this, caches load adjacent data along with the requested data, improving hit rates.
- **Temporal locality**: If data is accessed, it's likely to be accessed again in the near future. Caches use this principle to retain recently accessed data to improve the hit rate.

In fact, **arrays and linked lists have different cache utilization efficiencies**, which is mainly reflected in the following aspects.

- **Occupied space**: Linked list elements take up more space than array elements, resulting in less effective data being held in the cache.
- **Cache lines**: Linked list data is scattered throughout the memory, and cache is "loaded by row", so the proportion of invalid data loaded is higher.
- **Prefetch mechanism**: The data access pattern of arrays is more "predictable" than that of linked lists, that is, it is easier for the system to guess the data that is about to be loaded.
- **Spatial locality**: Arrays are stored in a continuous memory space, so data near the data being loaded is more likely to be accessed soon.

Overall, **arrays have a higher cache hit rate and are generally more efficient in operation than linked lists**. This makes data structures based on arrays more popular in solving algorithmic problems.

It should be noted that **high cache efficiency does not mean that arrays are always better than linked lists**. The choice of data structure should depend on specific application requirements. For example, both arrays and linked lists can implement the "stack" data structure (which will be detailed in the next chapter), but they are suitable for different scenarios.

- In algorithm problems, we tend to choose stacks based on arrays because they provide higher operational efficiency and random access capabilities, with the only cost being the need to pre-allocate a certain amount of memory space for the array.
- If the data volume is very large, highly dynamic, and the expected size of the stack is difficult to estimate, then a stack based on a linked list is a better choice. Linked lists can distribute a large amount of data in different parts of the memory and avoid the additional overhead of array expansion.
