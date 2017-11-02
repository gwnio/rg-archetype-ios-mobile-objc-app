#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonSingleRowTableViewDataSource : NSObject<UITableViewDataSource>

@property NSString *cellId;
@property UITableViewCellSelectionStyle selectionStyle;

- (id)initWithCell:(NSString*)cellId :(UITableViewCellSelectionStyle)selectionStyle;

@end
