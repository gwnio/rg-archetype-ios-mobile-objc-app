#import "CommonBaseHttpService.h"
#import "CommonLogUtils.h"
#import "CommonCustomMessages.h"

@implementation CommonBaseHttpService

+ (NSMutableURLRequest*)newPostReq:(NSURL*)url :(NSString*)body
{
	NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
	NSString *dataLen = [NSString stringWithFormat:@"%lu", (unsigned long)[data length]];
	
	NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
	[req setHTTPMethod:@"POST"];
	[req setValue:dataLen forHTTPHeaderField:@"Content-Length"];
	[req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[req setHTTPBody:data];
	return req;
}

+ (CommonBasicResponseDTO*)markInternalErrorResponse:(NSError*)error
{
	if (error != nil) {
		[CommonLogUtils logError:error];
	}
	CommonBasicResponseDTO *response = [[CommonBasicResponseDTO alloc] init:CommonBasicResponseResultFail];
	[response addError:CommonCustomMessagesInternalError];
	return response;
}

@end
