#import "CommonOkAlertView.h"

@interface CommonOkAlertView () <UIAlertViewDelegate>

@end

@implementation CommonOkAlertView {
	__block void(^_onOkSelect)();
}

- (id)initWithMessage:(NSString*)message onOkSelect:(void (^)())onOkSelect
{
	_onOkSelect = onOkSelect;
	self = [self initWithTitle:nil message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0) {
		if (_onOkSelect != nil) {
			_onOkSelect();
		}
	}
}

@end
