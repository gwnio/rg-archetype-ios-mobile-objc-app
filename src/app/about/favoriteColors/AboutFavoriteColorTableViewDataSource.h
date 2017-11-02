#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AboutFavoriteColorSelectDelegate.h"

@interface AboutFavoriteColorTableViewDataSource : NSObject<UITableViewDataSource>

@property NSMutableArray *data;
@property id<AboutFavoriteColorSelectDelegate> rowSelectDelegate;

@end
