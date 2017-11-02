#import "TitleBar.h"
#import "UIView+CommonAutoLayout.h"
#import "WidgetConstants.h"
#import "WidgetUtils.h"

@implementation TitleBar

- (id)initForAutoLayout
{
	self = [super initForAutoLayout];
	if (self) {
		[WidgetUtils applyTitleBarBackgroundColor:self];
		
		[self addSubview:self.menuButton];
		[self addSubview:self.titleText];
		
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
	
	[self autoSetDimension:ALDimensionHeight toSize:WidgetConstants_TitleBarHeight];
}

- (void) configureForTitleOnly
{
	self.menuButton.hidden = YES;
	[self.menuButton autoRemoveConstraintsAffectingView];
}

@end
