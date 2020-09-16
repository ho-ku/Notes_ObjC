//
//  NotesVC.h
//  Notes
//
//  Created by Денис Андриевский on 15.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"
#import "Note+CoreDataClass.h"
#import "NoteCell.h"
#import "NoteDetailVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotesVC : UIViewController
@property NSMutableArray<Note *> *notes;
@property CoreDataManager *coredataManager;
@end

NS_ASSUME_NONNULL_END
