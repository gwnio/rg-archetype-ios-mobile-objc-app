#import "MenuTableViewCell.h"
#import "UIColor+Common.h"
#import "WidgetConstants.h"

@implementation MenuTableViewCell

+ (NSString*)reuseId
{
	return NSStringFromClass([self class]);
}

+ (NSString*)nibName
{
	return @"MenuTableViewCell";
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		UIView *bckgrndVw = [[UIView alloc] initWithFrame:self.frame];
		bckgrndVw.backgroundColor = [UIColor common_fromHex:WidgetConstants_StyleViewSelectColorHex];
		self.selectedBackgroundView = bckgrndVw;
	}
	return self;
}

@end
