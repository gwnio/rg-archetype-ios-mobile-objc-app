#import <UIKit/UIKit.h>

@interface UIButton (App)

+ (UIButton *)app_newImageButton:(NSString *)imageName :(int)width :(int)height;

- (void)app_applyStandardStyle;
- (void)app_addTouchEventStyle:(NSString *)touchDownColorHex;

@end
