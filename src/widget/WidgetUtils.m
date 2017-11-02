#import "WidgetUtils.h"
#import "UIColor+Common.h"
#import "WidgetConstants.h"

@implementation WidgetUtils

+ (void)applyTitleBarBackgroundColor:(UIView *)view
{
	view.backgroundColor = [UIColor common_fromHex:WidgetConstants_SytleTitleBarBackgroundColorHex];
}

+ (UIFont *)titleBarFontWithSize:(CGFloat)size
{
	return [UIFont fontWithName:@"Helvetica-Bold" size:size];
}

+ (UIFont *)titleBarFont
{
	return [self titleBarFontWithSize:18];
}

@end
