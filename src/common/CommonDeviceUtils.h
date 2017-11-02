#import <Foundation/Foundation.h>

@interface CommonDeviceUtils : NSObject

+ (BOOL)isConnectionAvailable;

+ (BOOL)osVerEq:(NSString *)v;
+ (BOOL)osVerGt:(NSString *)v;
+ (BOOL)osVerGtEq:(NSString *)v;
+ (BOOL)osVerLt:(NSString *)v;
+ (BOOL)osVerLtEq:(NSString *)v;

@end
