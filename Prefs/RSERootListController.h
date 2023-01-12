#import <UIKit/UIKit.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>
#import <Rose/libRose.h>

@interface RSEAppearanceSettings : HBAppearanceSettings
@end

@interface RSERootListController : HBRootListController {
    UITableView * _table;
}
@property (nonatomic, strong) UISwitch* enableSwitch;
@property (nonatomic, strong) UIView* headerView;
@property (nonatomic, strong) UIImageView* headerImageView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* iconView;
- (void)toggleState;
- (void)setEnableSwitchState;
- (void)resetPrompt;
- (void)resetPreferences;
- (void)respring;
- (void)respringUtil;
@end

@interface NSTask : NSObject
@property(copy)NSString* launchPath;
- (void)launch;
@end