function mergeSort(nums1, nums2) {
  const sorted = [];
  
  const arr1 = Array.from(nums1);
  const arr2 = Array.from(nums2);
  while (arr1.length > 0 && arr2.length > 0) {
    if (arr1[0] >= arr2[0]) {
      sorted.push(arr2.shift());
    }
    else {
      sorted.push(arr1.shift());
    }
  }

  return sorted.concat(nums1)
               .concat(nums2);
}

const nums1 = [1,2,3];
const nums2 = [4,5,6];

mergeSort(nums1, nums2);