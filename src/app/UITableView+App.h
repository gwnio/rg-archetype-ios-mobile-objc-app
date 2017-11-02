#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UITableView (App)

- (void) app_configEstimateHeight:(CGFloat)estimatedCellHeight;
- (void) app_configDisableMarginsReadableContentGuide;

+ (UITableView*) app_autoLayoutWithEstimatedCellheightTable;
+ (UITableView*) app_autoLayoutWithEstimatedCellHeightTable:(CGFloat)estimatedCellHeight;

@end
