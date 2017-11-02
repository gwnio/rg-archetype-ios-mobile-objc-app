#import "TitleBar2.h"
#import "UIView+CommonAutoLayout.h"
#import "WidgetConstants.h"
#import "WidgetUtils.h"

@implementation TitleBar2

- (id)initForAutoLayout
{
	self = [super initForAutoLayout];
	if (self) {
		[WidgetUtils applyTitleBarBackgroundColor:self];
		
		[self addSubview:self.menuButton];
		[self addSubview:self.titleText];
		[self addSubview:self.menu2Button];
		
		[self applyConstraints];
	}
	return self;
}

- (UIButton *)menuButton
{
	if (_menuButton == nil) {
		_menuButton = [[UIButton alloc] initForAutoLayout];
		[_menuButton setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_menuButton setImage:[UIImage imageNamed:@"navigation_menu"] forState:UIControlStateNormal];
	}
	return _menuButton;
}

- (UIButton *)menu2Button
{
	if (_menu2Button == nil) {
		_menu2Button = [[UIButton alloc] initForAutoLayout];
		[_menu2Button setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_menu2Button setImage:[UIImage imageNamed:@"navigation_menu"] forState:UIControlStateNormal];
	}
	return _menu2Button;
}

- (UILabel *)titleText
{
	if (_titleText == nil) {
		_titleText = [[UILabel alloc] initForAutoLayout];
		_titleText.textColor = [UIColor whiteColor];
		_titleText.font = [WidgetUtils titleBarFont];
	}
	return _titleText;
}

- (void)applyConstraints
{
	[self.menuButton autoCenterInSuperviewAlongAxis:ALAxisHorizontal];
	[self.menuButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
	[self.menuButton autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self];
	[self.menuButton autoSetDimension:ALDimensionWidth toSize:WidgetConstants_BTN_WIDTH];
	
	[self.titleText autoCenterInSuperviewAlongAxis:ALAxisHorizontal];
	[self.titleText autoCenterInSuperviewAlongAxis:ALAxisVertical];
	[self.titleText autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.menuButton withOffset:5 relation:NSLayoutRelationGreaterThanOrEqual];
	[self.titleText autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:3.0 relation:NSLayoutRelationLessThanOrEqual];
	
	[self.menu2Button autoCenterInSuperviewAlongAxis:ALAxisHorizontal];
	[self.menu2Button autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
	[self.menu2Button autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self];
	[self.menu2Button autoSetDimension:ALDimensionWidth toSize:WidgetConstants_BTN_WIDTH];
	
	[self autoSetDimension:ALDimensionHeight toSize:WidgetConstants_TitleBarHeight];
}

@end
