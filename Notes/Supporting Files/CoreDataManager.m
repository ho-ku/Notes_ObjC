//
//  CoreDataManager.m
//  Notes
//
//  Created by Денис Андриевский on 15.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataManager ()
@property AppDelegate *appDelegate;
@property NSManagedObjectContext *context;
@end

@implementation CoreDataManager

- (instancetype)init {
    if (self = [super init]) {
        self.appDelegate = [AppDelegate new];
        self.context = self.appDelegate.persistentContainer.viewContext;
    }
    return self;
}

- (NSMutableArray<Note *> *)fetchNotes {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Note"];
    NSError *error;
    NSArray *notes = [self.context executeFetchRequest:request error:&error];
    if (error != nil) {
        NSLog(@"Error occured, %@", [error localizedDescription]);
        return [NSMutableArray alloc];
    } else {
        return [notes mutableCopy];
    }
}

- (void)saveNoteWithTitle:(NSString*)title andBody:(NSString*)body {
    NSManagedObject *newNote= [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:self.context];
    [newNote setValue:title forKey:@"title"];
    [newNote setValue:body forKey:@"body"];
    NSError *error;
    [self.context save:&error];
    if (error != nil) {
        NSLog(@"Failed to save: %@", [error localizedDescription]);
    }
}

- (void)deleteNote:(Note*)note {
    [self.context deleteObject:note];
    NSError *error;
    [self.context save:&error];
    if (error != nil) {
        NSLog(@"Failed to remove: %@", [error localizedDescription]);
    }
}

@end
