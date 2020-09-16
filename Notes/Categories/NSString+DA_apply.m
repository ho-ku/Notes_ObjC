//
//  NSString+DA_apply.m
//  Notes
//
//  Created by Денис Андриевский on 16.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import "NSString+DA_apply.h"

@implementation NSString (DA_apply)
- (BOOL)da_apply {
    return (self != nil && ![self  isEqual: @""]);
}
@end
