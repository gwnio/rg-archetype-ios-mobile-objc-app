#import <UIKit/UIKit.h>

@interface CommonActivityIndicatorTableViewCell : UITableViewCell

+ (NSString*)reuseId;

@property UIActivityIndicatorView *activityIndicatorView;

@end
