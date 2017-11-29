# Merge Sort: Counting Inversions 

In an array, **_arr =[arr_0, arr_1, ...., arr_n-1]_** , the elements at indices _**i**_ and **_j_** (where **_i < j_**) form an inversion if . In other words, inverted elements arr_i and arr_j are considered to be "out of order". To correct an inversion, we can swap adjacent elements.

For example, consider **_arr = [2,4,1]_** . It has two inversions: **_(2,1)_**  and **_(4,1)_**. To sort the array, we must perform the following two swaps to correct the inversions:

 **_arr = [2,4,1] ------------>swap (arr_1, arr_2)----> swap(arr_0, arr_1)[1,2,4]_**

Given **_d_** datasets, print the number of inversions that must be swapped to sort each dataset on a new line.

## Input Format

The first line contains an integer, **_d_** , denoting the number of datasets. 
The **_2d_** subsequent lines describe each respective dataset over two lines:  

1. The first line contains an integer, **_n_**, denoting the number of elements in the dataset.
2. The second line contains **_n_** space-separated integers describing the respective values of **_arr_0, arr_1, ...., arr_n-1_**.
Constraints

## Output Format

For each of the **_d_** datasets, print the number of inversions that must be swapped to sort the dataset on a new line.

## Sample Input

2  
5  
1 1 1 2 2  
5  
2 1 3 1 2  

## Sample Output

0  
4   

## Explanation

We sort the following **_d = 2_** datasets:

1. **_arr = [1,1,1,2,2]_** is already sorted, so there are no inversions for us to correct. Thus, we print **_0_** on a new line.
 
2. **_arr = [2,1,3,1,2]  ---> 1swap = [1,2,3,1,2] ---> 2swaps = [1,1,2,3,2] ---> 1swap = [1,1,2,2,3]_**  As we performed a total of  swaps to correct inversions, we print  on a new line.
