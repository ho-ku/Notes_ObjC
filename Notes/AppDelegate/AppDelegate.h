//
//  AppDelegate.h
//  Notes
//
//  Created by Денис Андриевский on 14.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

