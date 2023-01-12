#import "KRTableCell.h"

@interface KRLinkCell : KRTableCell

@property (nonatomic, assign, readonly) BOOL isBig;

@property (nonatomic, strong, readonly) UIView *avatarView;

@property (nonatomic, strong, readonly) UIImageView *avatarImageView;

@property (nonatomic, strong) UIImage *avatarImage;

@end