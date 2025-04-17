//
//	DuoTwitterCell.m
//	With this, my bastardization of CepheiPrefs is complete
//	Witness me
//
//	The way this checks screen width is flawed, so dont use this till this
//	message is no longer here :)
//
//	Apache 2.0 License for cephei code used in KRPrefsLicense located in
//preference bundle
//

#import "DuoTwitterCell.h"
#import <Foundation/Foundation.h>
#import <Preferences/PSSpecifier.h>
#import <UIKit/UIColor+Private.h>
#import <UIKit/UIImage+Private.h>
#import <version.h>

@interface KRLinkCell ()

- (BOOL)shouldShowAvatar;

@end

@interface DuoTwitterCell () {
  NSString *_user;
  NSString *_user2;
}

@end

@implementation DuoTwitterCell

+ (NSString *)_urlForUsername:(NSString *)user {

  user = [user stringByAddingPercentEncodingWithAllowedCharacters:
                   [NSCharacterSet URLQueryAllowedCharacterSet]];

  if ([[UIApplication sharedApplication]
          canOpenURL:[NSURL URLWithString:@"aphelion://"]]) {
    return [@"aphelion://profile/" stringByAppendingString:user];
  } else if ([[UIApplication sharedApplication]
                 canOpenURL:[NSURL URLWithString:@"tweetbot://"]]) {
    return [@"tweetbot:///user_profile/" stringByAppendingString:user];
  } else if ([[UIApplication sharedApplication]
                 canOpenURL:[NSURL URLWithString:@"twitterrific://"]]) {
    return
        [@"twitterrific:///profile?screen_name=" stringByAppendingString:user];
  } else if ([[UIApplication sharedApplication]
                 canOpenURL:[NSURL URLWithString:@"tweetings://"]]) {
    return [@"tweetings:///user?screen_name=" stringByAppendingString:user];
  } else if ([[UIApplication sharedApplication]
                 canOpenURL:[NSURL URLWithString:@"twitter://"]]) {
    return [@"twitter://user?screen_name=" stringByAppendingString:user];
  } else {
    return [@"https://mobile.twitter.com/" stringByAppendingString:user];
  }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                    specifier:(PSSpecifier *)specifier {
  self = [super initWithStyle:style
              reuseIdentifier:reuseIdentifier
                    specifier:specifier];

  if (self) {

    _user = specifier.properties[@"firstAccount"];
    _user2 = specifier.properties[@"secondAccount"];

    UIView *duoCellView = [[UIView alloc]
        initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,
                                 57)];

    UIView *cellOne = [[UIView alloc]
        initWithFrame:CGRectMake(0, 0,
                                 [UIScreen mainScreen].bounds.size.width / 2,
                                 57)];
    UIView *cellTwo = [[UIView alloc]
        initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 0,
                                 [UIScreen mainScreen].bounds.size.width / 2,
                                 57)];

    UIImageView *avatarViewOne =
        [[UIImageView alloc] initWithFrame:CGRectMake(15, 9.33333, 43, 43)];
    UIImageView *avatarViewTwo =
        [[UIImageView alloc] initWithFrame:CGRectMake(15, 9.33333, 43, 43)];

    dispatch_queue_t q =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(q, ^{
      UIImage *avatarImageOne = nil;
      UIImage *avatarImageTwo = nil;

      NSURL *imageURLOne =
          [NSURL URLWithString:@"https://github.com/LittenArchive.png"];
      NSURL *imageURLTwo = [NSURL URLWithString:@"https://github.com/74k1.png"];

      NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(
          NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];

      NSString *avatarPathOne = [cacheDir
          stringByAppendingPathComponent:
              [NSString stringWithFormat:@"%@_%@.png",
                                         NSStringFromClass([self class]),
                                         @"LittenArchive"]];

      NSString *avatarPathTwo = [cacheDir
          stringByAppendingPathComponent:[NSString
                                             stringWithFormat:@"%@_%@.png",
                                                              NSStringFromClass(
                                                                  [self class]),
                                                              @"74k1"]];

      if (!avatarImageOne) {
        avatarImageOne = [UIImage imageWithContentsOfFile:avatarPathOne];
      }

      if (!avatarImageOne) {
        NSData *imageDataOne =
            [[NSData alloc] initWithContentsOfURL:imageURLOne];
        if (imageDataOne) {
          avatarImageOne = [UIImage imageWithData:imageDataOne];
          [imageDataOne writeToFile:avatarPathOne atomically:YES];
        }
      }

      if (!avatarImageTwo) {
        avatarImageTwo = [UIImage imageWithContentsOfFile:avatarPathTwo];
      }

      if (!avatarImageTwo) {
        NSData *imageDataTwo =
            [[NSData alloc] initWithContentsOfURL:imageURLTwo];
        if (imageDataTwo) {
          avatarImageTwo = [UIImage imageWithData:imageDataTwo];
          [imageDataTwo writeToFile:avatarPathTwo atomically:YES];
        }
      }

      dispatch_async(dispatch_get_main_queue(), ^{
        [UIView transitionWithView:avatarViewOne
                          duration:0.2
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                          [avatarViewOne setImage:avatarImageOne];
                        }
                        completion:nil];
        [UIView transitionWithView:avatarViewTwo
                          duration:0.2
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                          [avatarViewTwo setImage:avatarImageTwo];
                        }
                        completion:nil];
      });
    });

    avatarViewOne.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    avatarViewOne.userInteractionEnabled = NO;
    avatarViewOne.clipsToBounds = YES;
    avatarViewOne.layer.cornerRadius = IS_IOS_OR_NEWER(iOS_7_0) ? 43 / 2 : 4.f;
    avatarViewOne.layer.borderWidth = 2;
    avatarViewOne.layer.borderColor =
        [[[UIColor labelColor] colorWithAlphaComponent:0.1] CGColor];

    avatarViewTwo.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    avatarViewTwo.userInteractionEnabled = NO;
    avatarViewTwo.clipsToBounds = YES;
    avatarViewTwo.layer.cornerRadius = IS_IOS_OR_NEWER(iOS_7_0) ? 43 / 2 : 4.f;
    avatarViewTwo.layer.borderWidth = 2;
    avatarViewTwo.layer.borderColor =
        [[[UIColor labelColor] colorWithAlphaComponent:0.1] CGColor];

    [cellOne addSubview:avatarViewOne];
    [cellTwo addSubview:avatarViewTwo];

    UILabel *displayNameOne =
        [[UILabel alloc] initWithFrame:CGRectMake(68, 9, 100, 20.3333)];
    displayNameOne.text =
        [@"" stringByAppendingString:specifier.properties[@"firstLabel"]];

    UILabel *displayNameTwo =
        [[UILabel alloc] initWithFrame:CGRectMake(68, 9, 100, 20.3333)];
    displayNameTwo.text =
        [@"" stringByAppendingString:specifier.properties[@"secondLabel"]];

    UILabel *accountNameOne =
        [[UILabel alloc] initWithFrame:CGRectMake(68, 32.3333, 100, 15)];
    accountNameOne.text =
        [@"@" stringByAppendingString:specifier.properties[@"firstAccount"]];

    UILabel *accountNameTwo =
        [[UILabel alloc] initWithFrame:CGRectMake(68, 32.3333, 100, 15)];
    accountNameTwo.text =
        [@"@" stringByAppendingString:specifier.properties[@"secondAccount"]];

    if (@available(iOS 13, *)) {
      displayNameOne.textColor = [UIColor labelColor];
      displayNameTwo.textColor = [UIColor labelColor];
      accountNameOne.textColor = [UIColor secondaryLabelColor];
      accountNameTwo.textColor = [UIColor secondaryLabelColor];
    } else {
      displayNameOne.textColor = [UIColor blackColor];
      displayNameTwo.textColor = [UIColor blackColor];
      accountNameOne.textColor = [UIColor grayColor];
      accountNameTwo.textColor = [UIColor grayColor];
    }

    displayNameOne.font = [UIFont boldSystemFontOfSize:16];
    displayNameTwo.font = [UIFont boldSystemFontOfSize:16];
    accountNameOne.font = [UIFont systemFontOfSize:11];
    accountNameTwo.font = [UIFont systemFontOfSize:11];

    [cellOne addSubview:displayNameOne];
    [cellOne addSubview:accountNameOne];

    [cellTwo addSubview:displayNameTwo];
    [cellTwo addSubview:accountNameTwo];

    UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc]
        initWithTarget:self
                action:@selector(handleLeftTap:)];
    [cellOne addGestureRecognizer:leftTap];

    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc]
        initWithTarget:self
                action:@selector(handleRightTap:)];
    [cellTwo addGestureRecognizer:rightTap];

    [duoCellView addSubview:cellOne];

    UIView *separator = [[UIView alloc]
        initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width / 2,
                                 0, 0.333, 57)];
    separator.backgroundColor = [UIColor
        colorWithWhite:0.5
                 alpha:0.5]; // TODO: get the actual one, programmatically
    [duoCellView addSubview:separator];

    [duoCellView addSubview:cellTwo];

    [self.contentView addSubview:duoCellView];
  }

  return self;
}
- (void)handleLeftTap:(UITapGestureRecognizer *)recognizer {
  [[UIApplication sharedApplication]
                openURL:[NSURL URLWithString:[self.class _urlForUsername:_user]]
                options:@{}
      completionHandler:nil];
}
- (void)handleRightTap:(UITapGestureRecognizer *)recognizer {
  [[UIApplication sharedApplication]
                openURL:[NSURL
                            URLWithString:[self.class _urlForUsername:_user2]]
                options:@{}
      completionHandler:nil];
}

- (void)setSelected:(BOOL)arg1 animated:(BOOL)arg2 {
  [super setSelected:arg1 animated:arg2];

  if (!arg1)
    return;
  //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.class
  //_urlForUsername:_user]] options:@{} completionHandler:nil];
}

#pragma mark - Avatar

- (BOOL)shouldShowAvatar {
  // HBLinkTableCell doesn’t want avatars by default, but we do. override its
  // check method so that if showAvatar is unset, we return YES
  return YES;
}

@end