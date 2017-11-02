#import <UIKit/UIKit.h>
#import "UIView+AutoLayout.h"

@interface UIView (CommonAutoLayout)

- (void)stackViewsVertically:(NSArray*)views;

- (void)stackViewsVertically:(NSArray*)views :(float)offset;

- (void)stackViewsVertically:(NSArray*)views :(BOOL)fit :(float)offset;

- (void)stackViewsHorizontally:(NSArray*)views :(ALEdge)startEdge :(BOOL)fit :(float)offset;

- (NSDictionary *) autoPinTopBottomViewController:(UIViewController *)vc;

- (NSDictionary *) autoPinTopBottomViewController:(UIViewController *)vc wthInset:(CGFloat)inset;

- (NSDictionary *) autoPinLeftRightToSuper;

- (NSDictionary *) autoPinLeftRightToSuperWithInset:(CGFloat)inset;

@end
