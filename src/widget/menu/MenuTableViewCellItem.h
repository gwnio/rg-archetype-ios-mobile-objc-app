#import <Foundation/Foundation.h>

@interface MenuTableViewCellItem : NSObject

@property NSNumber *row;
@property NSString *imageNamed;
@property NSString *label;

- (id)init:(NSNumber*)row :(NSString*)label :(NSString*)imageNamed;

@end
