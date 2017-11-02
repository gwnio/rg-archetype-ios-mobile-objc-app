#import <UIKit/UIKit.h>

@interface CommonOkAlertView : UIAlertView

- (id)initWithMessage:(NSString*)message onOkSelect:(void (^)())onOkSelect;

@end
