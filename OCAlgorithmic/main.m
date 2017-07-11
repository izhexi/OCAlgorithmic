//
//  main.m
//  OCAlgorithmic
//
//  Created by yenge on 2017/7/11.
//  Copyright © 2017年 chenyun. All rights reserved.
//

#import <Foundation/Foundation.h>
void selectionSort(NSArray *arr);
void bubbleSort(NSArray *arr);
void insertSort(NSArray *arr);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr = @[@11,@21,@1,@9,@99,@32,@43,@10];
        selectionSort(arr);
        bubbleSort(arr);
        bubbleSort(@[@1,@2,@3,@4,@5,@6]);
        insertSort(arr);
    }
    return 0;
}

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
