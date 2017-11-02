#import "AppWidgetUtils.h"
#import "UIColor+Common.h"

@implementation AppWidgetUtils

+ (void)applyBackgroundColor0:(UIView *)view
{
	view.backgroundColor = [UIColor common_fromHex:@"edecef"];
}

+ (void)applyButtonToolbarStyle:(UIView *)view
{
	[self applyBackgroundColor0:view];
	view.layer.borderColor = [UIColor common_fromHex:@"CDCDCD"].CGColor;
	view.layer.borderWidth = 0.4f;
}

@end
