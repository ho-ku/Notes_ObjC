//
//  CoreDataManager.h
//  Notes
//
//  Created by Денис Андриевский on 15.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note+CoreDataClass.h"
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataManager : NSObject

- (NSMutableArray<Note *> *)fetchNotes;
- (void)saveNoteWithTitle:(NSString*)title andBody:(NSString*)body;
- (void)deleteNote:(Note*)note;
@end

NS_ASSUME_NONNULL_END
