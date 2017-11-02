#import <Foundation/Foundation.h>

@interface CommonAsyncCommand : NSObject

+ (void)execute:(void (^)())preCommand :(NSObject* (^)())command :(void (^)(NSObject*))postCommand;

@end
