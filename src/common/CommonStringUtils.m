#import "CommonStringUtils.h"

@implementation CommonStringUtils

+ (BOOL)isEmpty:(NSString *)str
{
	return str == nil || str.length == 0;
}

+ (BOOL)isNotEmpty:(NSString*)str
{
	return ![self isEmpty:str];
}

@end
