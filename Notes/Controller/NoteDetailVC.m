//
//  NoteDetailVC.m
//  Notes
//
//  Created by Денис Андриевский on 16.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import "NoteDetailVC.h"

@interface NoteDetailVC ()
// MARK: - IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@end

@implementation NoteDetailVC


// MARK: - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.currentNote.title;
    self.bodyLabel.text = self.currentNote.body;
}

@end
