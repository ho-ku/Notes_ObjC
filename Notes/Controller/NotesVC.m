//
//  NotesVC.m
//  Notes
//
//  Created by Денис Андриевский on 15.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import "NotesVC.h"
#define C_NoteCellIdentifier @"NoteCell"
#define C_NoteCellHeight 100
#define C_NewNoteSegueIdentifier @"newNoteSegue"
#define C_DetailSegueIdentifier @"detailSegue"

@interface NotesVC () <UITableViewDataSource, UITableViewDelegate>
// MARK: - IBOutlets
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property Note *selectedNote;

@end

@implementation NotesVC

// MARK: - Lifecycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.notes = [self.coredataManager fetchNotes];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.coredataManager = [[CoreDataManager alloc] init];
}

// MARK: - IBActions
- (IBAction)addNoteBtnPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:C_NewNoteSegueIdentifier sender:self];
}

// MARK: - UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NoteCell *cell = [tableView dequeueReusableCellWithIdentifier:C_NoteCellIdentifier forIndexPath:indexPath];
    Note *currentNote = self.notes[indexPath.row];
    cell.noteTitleLabel.text = currentNote.title;
    cell.noteBodyLabel.text = currentNote.body;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.notes count];
}

// MARK: - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (CGFloat)C_NoteCellHeight;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"Delete" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        __weak NotesVC *weakSelf = self;
        Note *noteToDelete = weakSelf.notes[indexPath.row];
        [weakSelf.coredataManager deleteNote:noteToDelete];
        [weakSelf.notes removeObjectAtIndex:indexPath.row];
        [weakSelf.tableView deleteRowsAtIndexPaths:[[NSArray<NSIndexPath *> alloc] initWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    }];
    NSArray<UIContextualAction *> *actions = [[NSArray alloc] initWithObjects:deleteAction, nil];
    UISwipeActionsConfiguration *confiuration = [UISwipeActionsConfiguration configurationWithActions:actions];
    return confiuration;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedNote = self.notes[indexPath.row];
    [self performSegueWithIdentifier:C_DetailSegueIdentifier sender:self];
    
}

// MARK: - Prepare for segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:C_DetailSegueIdentifier]) {
        NoteDetailVC *dest = segue.destinationViewController;
        dest.currentNote = self.selectedNote;
    }
}


@end
