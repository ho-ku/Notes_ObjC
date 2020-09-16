//
//  Note+CoreDataProperties.h
//  Notes
//
//  Created by Денис Андриевский on 15.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//
//

#import "Note+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Note (CoreDataProperties)

+ (NSFetchRequest<Note *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *body;

@end

NS_ASSUME_NONNULL_END
