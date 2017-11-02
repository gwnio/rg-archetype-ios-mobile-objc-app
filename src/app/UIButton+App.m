#import "UIButton+App.h"
#import "UIView+AutoLayout.h"
#import "UIColor+Common.h"
#import "UIControl+Common.h"
#import "UIView+Common.h"

@implementation UIButton (App)

+ (UIButton *)app_newImageButton:(NSString *)imageName :(int)width :(int)height
{
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
	[button app_applyStandardStyle];
	[button autoSetDimension:ALDimensionWidth toSize:width];
	[button autoSetDimension:ALDimensionHeight toSize:height];
	return button;
}

- (void)app_applyStandardStyle
{
	[self setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	self.backgroundColor = [UIColor common_fromHex:@"F0F0F0"];
	[self app_addTouchEventStyle:@"FFAD5B"];
	
	[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
	
	self.layer.borderWidth = .5f;
	self.layer.cornerRadius = 5.0f;
	self.layer.borderColor = [UIColor common_fromHex:@"B0B0B0"].CGColor;
}

- (void)app_addTouchEventStyle:(NSString *)touchDownColorHex
{
	[self common_addEventHandler:^{
		[self common_touchHighlight:touchDownColorHex];
	} forControlEvents:UIControlEventTouchDown];
}

@end
