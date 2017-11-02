#import <UIKit/UIKit.h>

typedef void (^CommonYesNoAlertViewCommand)();

@interface CommonYesNoAlertView : UIAlertView

@property(nonatomic) NSString *yesButtonTitle;
@property(nonatomic) NSString *noButtonTitle;
@property (nonatomic, strong) void (^onNoCommand)();
@property (nonatomic, strong) void (^onYesCommand)();

- (id)initWithMessage:(NSString*)message :(CommonYesNoAlertViewCommand)onNoSelect :(CommonYesNoAlertViewCommand)onYesSelect;
- (id)initWithButtonTitles:(NSString*)title :(NSString*)message :(NSString*)noButtonTitle :(NSString*)yesButtonTitle;
- (id)initWithTitle:(NSString*)title :(NSString*)message :(CommonYesNoAlertViewCommand)yesCommand :(CommonYesNoAlertViewCommand)noCommand;

@end
