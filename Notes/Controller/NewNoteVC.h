//
//  NewNoteVC.h
//  Notes
//
//  Created by Денис Андриевский on 14.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"
#import "NSString+DA_apply.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewNoteVC : UIViewController
@property CoreDataManager *coredataManager;
@end

NS_ASSUME_NONNULL_END
