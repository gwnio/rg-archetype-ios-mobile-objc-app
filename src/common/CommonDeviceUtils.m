#import "CommonDeviceUtils.h"
#import <UIKit/UIKit.h>
#import "Reachability.h"

@implementation CommonDeviceUtils

/*
 * https://developer.apple.com/library/ios/samplecode/Reachability/Introduction/Intro.html
 * http://stackoverflow.com/questions/1861656/iphone-reachability-checking
 */
+ (BOOL)isConnectionAvailable
{
	Reachability *r = [Reachability reachabilityForInternetConnection];
	NetworkStatus status = [r currentReachabilityStatus];
	BOOL rslt = (status == ReachableViaWiFi) || (status == ReachableViaWWAN);
	return rslt;
}

#pragma mark OS Version Checking
// Idea from http://stackoverflow.com/questions/7848766/how-can-we-programmatically-detect-which-ios-version-is-device-running-on
+ (BOOL)osVerEq:(NSString *)v {
	return [[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame;
}

+ (BOOL)osVerGt:(NSString *)v {
	return [[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending;
}

+ (BOOL)osVerGtEq:(NSString *)v {
	return [[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending;
}

+ (BOOL)osVerLt:(NSString *)v {
	return [[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending;
}

+ (BOOL)osVerLtEq:(NSString *)v {
	return [[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending;
}

@end
