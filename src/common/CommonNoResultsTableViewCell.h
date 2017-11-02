#import <UIKit/UIKit.h>

@interface CommonNoResultsTableViewCell : UITableViewCell

+ (NSString*)reuseId;

@property (nonatomic) UILabel *noResultsLabel;

@end
