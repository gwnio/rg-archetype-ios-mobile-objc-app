#import "TitleBar3.h"
#import "UIView+CommonAutoLayout.h"
#import "WidgetConstants.h"
#import "WidgetUtils.h"

@implementation TitleBar3

- (id)initForAutoLayout
{
	self = [super initForAutoLayout];
	if (self) {
		[WidgetUtils applyTitleBarBackgroundColor:self];
		
		[self addSubview:self.backButton];
		[self addSubview:self.titleText];
		
		[self applyConstraints];
	}
	return self;
}

- (UIButton *)backButton
{
	if (_backButton == nil) {
		_backButton = [[UIButton alloc] initForAutoLayout];
		[_backButton setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_backButton setImage:[UIImage imageNamed:@"icon_24_back"] forState:UIControlStateNormal];
	}
	return _backButton;
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
	[self.backButton autoCenterInSuperviewAlongAxis:ALAxisHorizontal];
	[self.backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
	[self.backButton autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self];
	[self.backButton autoSetDimension:ALDimensionWidth toSize:(1.5 * WidgetConstants_BTN_WIDTH) relation:NSLayoutRelationGreaterThanOrEqual];
	
	[self.titleText autoCenterInSuperviewAlongAxis:ALAxisHorizontal];
	[self.titleText autoCenterInSuperviewAlongAxis:ALAxisVertical];
	[self.titleText autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.backButton withOffset:5 relation:NSLayoutRelationGreaterThanOrEqual];
	[self.titleText autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:3.0 relation:NSLayoutRelationLessThanOrEqual];
	
	[self autoSetDimension:ALDimensionHeight toSize:WidgetConstants_TitleBarHeight];
}

@end
