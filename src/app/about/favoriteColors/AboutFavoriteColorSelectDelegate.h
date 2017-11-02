#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol AboutFavoriteColorSelectDelegate

@optional
- (void) onAboutFavoriteColorSelect:(UIViewController *)vc :(NSIndexPath *)indexPath :(NSString*)color;

@end
