//
//  NoteCell.h
//  Notes
//
//  Created by Денис Андриевский on 15.09.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoteCell : UITableViewCell
// MARK: - IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *noteTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteBodyLabel;

@end

NS_ASSUME_NONNULL_END
