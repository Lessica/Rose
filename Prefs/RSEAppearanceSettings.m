#import "RSERootListController.h"

@implementation RSEAppearanceSettings

- (UIColor *)tintColor {

    return [UIColor colorWithRed: 0.62 green: 0.67 blue: 0.98 alpha: 1.00];

}

- (UIColor *)statusBarTintColor {

    return [UIColor whiteColor];

}

- (UIStatusBarStyle)statusBarStyle {

    return UIStatusBarStyleLightContent;

}

- (UIColor *)navigationBarTitleColor {

    return [UIColor whiteColor];

}

- (UIColor *)navigationBarTintColor {

    return [UIColor whiteColor];

}

- (UIColor *)navigationBarBackgroundColor {

    return [UIColor colorWithRed: 0.62 green: 0.67 blue: 0.98 alpha: 1.00];

}

- (BOOL)translucentNavigationBar {

    return YES;

}

@end