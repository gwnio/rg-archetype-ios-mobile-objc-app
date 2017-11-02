#import <UIKit/UIKit.h>

@interface TitleBar : UIView

@property (nonatomic) UIButton *menuButton;
@property (nonatomic) UILabel *titleText;

- (void) configureForTitleOnly;

@end
