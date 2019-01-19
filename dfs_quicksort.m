//
//  main.m
//  dfs and quickSort-inplacepartition
//
//  Created by nmi on 2019/1/18.
//  Copyright © 2019 nmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sol : NSObject
+(void)minCoins:(NSArray*)src Int:(int)startIndex Sum:(int)sum Stk:(NSMutableArray*)stk Min:(int*)min;
+(void)min:(NSArray*)src Sum:(int)sum;
@end
@implementation Sol
+(void)minCoins:(NSArray*)src Int:(int)startIndex Sum:(int)sum Stk:(NSMutableArray*)stk Min:(int*)min
{
    if (sum == 0)
    {
        if (stk.count < *min)
        {
            *min = stk.count;
            for (NSString *obj in stk)
            {
                NSLog(@"%@", obj);
            }
            NSLog(@"-----");
        }
    }
    for (int i = startIndex; i < src.count; i++)
    {
        NSString *strn = [src objectAtIndex:i];
        [stk addObject:[src objectAtIndex:i]];
        [Sol minCoins:src Int:i+1 Sum:sum-[strn intValue] Stk:stk Min:min];
        [stk removeLastObject];
    }
}

+(void)min:(NSArray*)src Sum:(int)sum
{
    int min = 100;
    NSMutableArray *stk = [NSMutableArray new];
    for (int i = 0; i < src.count; i++)
    {
        NSString *strn = [src objectAtIndex:i];
        [stk addObject:[src objectAtIndex:i]];

        [Sol minCoins:src Int:i+1 Sum:sum-[strn intValue] Stk:stk Min:&min];
        [stk removeLastObject];
    }
    NSLog(@"MIN->%d", min);
}

+(void)quickSort:(NSMutableArray*)src
{
    [Sol quickSort:src Start:0 End:(int)src.count-1];
}

+(void)quickSort:(NSMutableArray*)src Start:(int)low End:(int)high
{
    if (low < high)
    {
        //Pivot is alreay in its place, so skip it in the following sorting.
        int pivot = [Sol inplacePartition:src Start:low End:high];
        [Sol quickSort:src Start:low End:pivot-1];
        [Sol quickSort:src Start:pivot+1 End:high];
    }
}

+(int)inplacePartition:(NSMutableArray*)src Start:(int)low End:(int)high
{
    int pivot = high;
    int bindex = low -1;
    NSLog(@"%d %d", low, high);
    int pi = (int)[[src objectAtIndex:pivot] integerValue];
    for (int i = low; i <= high; i++)
    {
        NSString* ele = [src objectAtIndex:i];
        if ( [ele integerValue] < pi)
        {
            bindex++;
            [src exchangeObjectAtIndex:i withObjectAtIndex:bindex];
        }
    }
    [src exchangeObjectAtIndex:bindex+1 withObjectAtIndex:pivot];
    return bindex + 1;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSArray *a = [NSArray arrayWithObjects:@"1", @"3", @"2", @"5", @"6", @"4", nil];
        [Sol min:a Sum:8];

        NSArray *b = [NSArray arrayWithObjects:@"6", @"3", @"2", @"5", @"1", @"4", nil];
        NSMutableArray *src = [NSMutableArray arrayWithArray:b];
        [Sol quickSort: src];
        int bre = 1;
    }
    return 0;
}
