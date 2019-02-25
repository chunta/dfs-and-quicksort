//
//  Sol.h
//  OmTest
//
//  Created by nmi on 2019/2/23.
//  Copyright © 2019 nmi. All rights reserved.
//

#ifndef Sol_h
#define Sol_h
#import <Foundation/Foundation.h>
#import "ISortValuable.h"
@interface Sol : NSObject
+(void)quickSort:(NSMutableArray<id<ISolValuable>>*)src Reverse:(BOOL)reverse;
@end

#endif /* Sol_h */
