##  emu8086  quicksort

#### 参考算法
``
/**
 * @author  TIAN
 * @brief   交换数组位置i和位置j的元素
 */
static void array_swap(int array[], int i, int j)
{
	int temp = array[i];
	array[i] = array[j];
	array[j] = temp;
}

/**
 * @author  TIAN
 * @brief   快速排序（哨兵筛选部分）
 */
static int array_qsort_partition(int array[], int low, int high)
{
	int pivot = low;

	while (low < hight)
	{
		while (pivot < hight)
		{
			if (array[pivot] <= array[hight])
			{
				hight--;
			}
			else
			{
				array_swap(array, pivot, hight);
				pivot = hight;
				break;
			}
		}

		while (low < pivot)
		{
			if (array[low] <= array[pivot])
			{
				low++;
			}
			else
			{
				array_swap(array, low, pivot);
				pivot = low;
				break;
			}
		}
	}

	return pivot;
}

/**
 * @author  TIAN
 * @brief   快速排序（递归部分）
 */
static void array_qsort(int array[], int low, int high)
{
	if (low < high)
	{
		int pivot = array_qsort_partition(array, low, high);
		array_qsort(array, low, pivot - 1);
		array_qsort(array, pivot + 1, high);
	}
}

``
