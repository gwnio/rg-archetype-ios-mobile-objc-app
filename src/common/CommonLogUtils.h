#import <Foundation/Foundation.h>

@interface CommonLogUtils : NSObject

+(void)logError:(NSError*)error;

+ (void)logException:(NSException*)exception;

@end
