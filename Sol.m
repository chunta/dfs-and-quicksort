//
//  Sol.m
//  OmTest
//
//  Created by nmi on 2019/2/23.
//  Copyright © 2019 nmi. All rights reserved.
//

#import "Sol.h"
@implementation Sol
+(void)quickSort:(NSMutableArray<id<ISolValuable>>*)src Reverse:(BOOL)reverse
{
    [Sol quickSort:src Start:0 End:(int)src.count-1 Reverse:reverse];
}

+(void)quickSort:(NSMutableArray<id<ISolValuable>>*)src Start:(int)low End:(int)high Reverse:(BOOL)reverse
{
    if (low < high)
    {
        //Pivot is alreay in its place, so skip it in the following sorting.
        int pivot = [Sol inplacePartition:src Start:low End:high Reverse:reverse];
        [Sol quickSort:src Start:low End:pivot-1 Reverse:reverse];
        [Sol quickSort:src Start:pivot+1 End:high Reverse:reverse];
    }
}

+(int)inplacePartition:(NSMutableArray<id<ISolValuable>>*)src Start:(int)low End:(int)high Reverse:(BOOL)reverse
{
    int pivot = high;
    int bindex = low -1;
    float pi = [[src objectAtIndex:pivot] valueForCompare];
    for (int i = low; i <= high; i++)
    {
        id<ISolValuable> ele = [src objectAtIndex:i];
        if (reverse)
        {
            if ( [ele valueForCompare] > pi)
            {
                bindex++;
                [src exchangeObjectAtIndex:i withObjectAtIndex:bindex];
            }
        }
        else
        {
            if ( [ele valueForCompare] < pi)
            {
                bindex++;
                [src exchangeObjectAtIndex:i withObjectAtIndex:bindex];
            }
        }
    }
    [src exchangeObjectAtIndex:bindex+1 withObjectAtIndex:pivot];
    return bindex + 1;
}
@end
