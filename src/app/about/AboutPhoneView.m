#import "AboutPhoneView.h"
#import "UIView+CommonAutoLayout.h"

@implementation AboutPhoneView {
	UIView *_contentView;
	UILabel *_aboutLabel;
}

- (instancetype)initForAutoLayout
{
	self = [super initForAutoLayout];
	
	[self initContentView];
	
	[self addSubview:self.titleBar];
	[self addSubview:_contentView];
	
	[self stackViewsVertically:@[self.titleBar, _contentView]];
	
	return self;
}

- (void) initContentView
{
	_aboutLabel = [[UILabel alloc] initForAutoLayout];
	_aboutLabel.numberOfLines = 0;
	_aboutLabel.lineBreakMode = NSLineBreakByWordWrapping;
	_aboutLabel.text = @"My phone number is XXX-XXX-XXXX";
	
	_contentView = [[UIView alloc] initForAutoLayout];
	[_contentView addSubview:_aboutLabel];
	
	CGFloat inset = 3.0;
	
	[_aboutLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:inset];
	[_aboutLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:inset];
	[_aboutLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:inset];
}

- (TitleBar2 *)titleBar
{
	if (_titleBar == nil) {
		_titleBar = [[TitleBar2 alloc] initForAutoLayout];
		_titleBar.titleText.text = @"About - Phone";
	}
	return _titleBar;
}

@end
