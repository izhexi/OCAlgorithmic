//
//  main.m
//  OCAlgorithmic
//
//  Created by yenge on 2017/7/11.
//  Copyright © 2017年 chenyun. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void selectionSort(NSArray *arr);
extern void bubbleSort(NSArray *arr);
extern void insertSort(NSArray *arr);
extern void shellSort(NSArray *arr);
extern void quickSort(NSArray *arr);
extern void quickSortIMP(NSInteger left,NSInteger right,NSArray *arr);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *arr = @[@11,@21,@1,@9,@99,@32,@43,@10].mutableCopy;
        selectionSort(arr);
        bubbleSort(arr);
        bubbleSort(@[@1,@2,@3,@4,@5,@6]);
        insertSort(arr);
        shellSort(@[@0,@2,@4,@55,@25,@3,@97,@32,@1,@12,@1,@21,@14]);
        quickSort(arr);
    }
    return 0;
}

/**
 *  选择排序
 *
 *
 */
void selectionSort(NSArray *arr) {
    if (!arr.count || !arr) {
        return;
    }
    NSMutableArray *sortArray = [arr mutableCopy];
    for (NSInteger i = 0; i < arr.count; i ++) {
        NSInteger min = [sortArray[i] integerValue];
        for (NSInteger j = i +1; j < arr.count; j ++) {
            NSInteger next = [sortArray[j] integerValue];
            if (next <= min) {
                min = next;
            }
        }
        NSInteger index = [sortArray indexOfObject:@(min)];
        NSInteger tempValue = [sortArray[i] integerValue];
        sortArray[i] = sortArray[index];
        sortArray[index] = @(tempValue);
    }
    NSLog(@"selection sorted:%@",sortArray);
}

/**
 *  冒泡排序
 *
 *  @param arr 需要排序的数组
 */
void bubbleSort(NSArray *arr) {
    NSMutableArray *sortArr = arr.mutableCopy;
    BOOL flag = NO;
    for (NSInteger i = 0; i < sortArr.count; i ++) {
        for (NSInteger j = i +1; j < sortArr.count; j ++) {
            NSInteger last = [sortArr[i] integerValue];
            NSInteger next = [sortArr[j] integerValue];
            if (next < last) {
                NSInteger temp = last;
                sortArr[i] = sortArr[j];
                sortArr[j] = @(temp);
                flag = YES;
            }
        }
        if (!flag) {
            break;
        }
    }
    NSLog(@"bubble sorted: %@",sortArr);
}

/**
 *  插入排序
 *
 *  @param arr  需要排序的数组
 */
void insertSort(NSArray *arr) {
    NSMutableArray *sortArr = arr.mutableCopy;
    for (NSInteger i = 0; i < sortArr.count -1; i ++) {
        for (NSInteger j = i + 1; j > 0; j --) {
            if ([sortArr[j] integerValue] < [sortArr[j - 1] integerValue]) {
                NSInteger temp = [sortArr[j - 1] integerValue];
                sortArr[j - 1] = sortArr[j];
                sortArr[j] = @(temp);
            } else break;
        }
    }
    NSLog(@"insert sorted: %@",sortArr);
}

/**
 *  希尔排序
 *
 *  @param arr 需要传入的排序数组
 */
void shellSort(NSArray *arr) {
    NSMutableArray *sortArr = arr.mutableCopy;
    NSInteger increment = sortArr.count;
    while (YES) {
        increment = increment / 2;
        for (NSInteger i = 0; i < increment; i ++) {
            for (NSInteger j = i; j < sortArr.count; j += increment) {
                for (NSInteger k = j + increment; k < sortArr.count; k += increment) {
                    if ([sortArr[k] integerValue] <= [sortArr[k -increment] integerValue]) {
                        NSInteger temp = [sortArr[k -increment] integerValue];
                        sortArr[k -increment] = sortArr[k];
                        sortArr[k] = @(temp);
                    }
                }
            }
        }
        if (increment == 1) {
            break;
        }
    }
    NSLog(@"shell sorted :%@",sortArr);
}


void quickSort(NSArray *arr) {
    NSInteger left = 0;
    NSInteger right = arr.count - 1;
    quickSortIMP(left, right, arr.mutableCopy);
}

void quickSortIMP(NSInteger left,NSInteger right,NSMutableArray *sortArr) {
    if (left >= right) {
        NSLog(@"qiuck sorted:%@",sortArr);
        return;
    }
    NSInteger l,r;
    l = left;
    r = right;
    NSInteger keyValue = [sortArr[l] integerValue];
    
    while (l < r) {
        while (l < r && [sortArr[r] integerValue] >= keyValue) {
            r --;
        }
        if (l < r) {
            sortArr[l] = sortArr[r];
            l ++;
        }
        while (l < r && [sortArr[l] integerValue] < keyValue) {
            l ++;
        }
        if (l < r) {
            sortArr[r] = sortArr[l];
            r --;
        }
    }
    sortArr[l] = @(keyValue);
    quickSortIMP(left, l-1, sortArr);
    quickSortIMP(l + 1, right, sortArr);
}
