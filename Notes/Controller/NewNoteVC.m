//
//  NewNoteVC.m
//  Notes
//
//  Created by Денис Андриевский on 14.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import "NewNoteVC.h"

@interface NewNoteVC () <UITextFieldDelegate, UITextViewDelegate>
// MARK: - IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *noteTitleField;

@property (weak, nonatomic) IBOutlet UITextView *noteBodyView;

@end

@implementation NewNoteVC

// MARK: - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.coredataManager = [[CoreDataManager alloc] init];
    self.noteBodyView.delegate = self;
    self.noteTitleField.delegate = self;
}

// MARK: - IBActions
- (IBAction)addNoteBtnPressed:(id)sender {
    NSString *titleText = self.noteTitleField.text;
    NSString *bodyText = self.noteBodyView.text;
    if ([titleText da_apply] && [bodyText da_apply]) {
        [self.coredataManager saveNoteWithTitle:titleText andBody:bodyText];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

// MARK: - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

// MARK: - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.noteBodyView.text = nil;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [self.noteBodyView resignFirstResponder];
    }
    return true;
}

@end
