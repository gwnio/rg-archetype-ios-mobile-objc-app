#import "AppData.h"

@implementation AppData

static AppData *instance;

+ (AppData *)getInstance
{
	if (instance == nil) {
		instance = [[AppData alloc] init];
	}
	return instance;
}

@end
