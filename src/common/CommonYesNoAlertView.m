#import "CommonYesNoAlertView.h"

@interface CommonYesNoAlertView () <UIAlertViewDelegate>

@end

@implementation CommonYesNoAlertView

- (id)initWithMessage:(NSString*)message :(CommonYesNoAlertViewCommand)onNoCommand :(CommonYesNoAlertViewCommand)onYesCommand
{
	self.onNoCommand = onNoCommand;
	self.onYesCommand = onYesCommand;
	self.yesButtonTitle = @"Yes";
	self.noButtonTitle = @"No";
	self = [self initWithTitle:@"" message:message delegate:self cancelButtonTitle:self.noButtonTitle otherButtonTitles:self.yesButtonTitle, nil];
	return self;
}

- (id)initWithButtonTitles:(NSString*)title :(NSString*)message :(NSString*)noButtonTitle :(NSString*)yesButtonTitle
{
	self.yesButtonTitle = yesButtonTitle;
	self.noButtonTitle = noButtonTitle;
	self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:noButtonTitle otherButtonTitles:yesButtonTitle, nil];
	return self;
}

- (id)initWithTitle:(NSString*)title :(NSString*)message :(CommonYesNoAlertViewCommand)yesCommand :(CommonYesNoAlertViewCommand)noCommand
{
	self.onYesCommand = yesCommand;
	self.onNoCommand = noCommand;
	self.yesButtonTitle = @"Yes";
	self.noButtonTitle = @"No";
	self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
	[self addButtonWithTitle:self.yesButtonTitle];
	[self addButtonWithTitle:self.noButtonTitle];
	return self;
}

@end
