#import "CommonBasicResponseDTO.h"

@implementation CommonBasicResponseDTO

NSString* const ERR_DOMAIN = @"ERR_DOMAIN";

- (id)init:(CommonBasicResponseResult)result
{
	self = [super init];
	[self setResult:result];
	return self;
}

- (CommonBasicResponseResult)getResult
{
	if (self.resultCode == 0) {
		return CommonBasicResponseResultCancel;
	} else if (self.resultCode == 1) {
		return CommonBasicResponseResultOk;
	}
	return CommonBasicResponseResultFail;
}

- (void)setResult:(CommonBasicResponseResult)result
{
	if (result == CommonBasicResponseResultCancel) {
		self.resultCode = 0;
	} else if (result == CommonBasicResponseResultOk) {
		self.resultCode = 1;
	} else {
		self.resultCode = -1;
	}
}

- (void)addError:(NSString*)error
{
	if (self.errs == nil) {
		self.errs = [[NSMutableArray alloc] init];
	}
	[self.errs addObject:error];
}

- (NSString*)getFirstError
{
	if (self.errs != nil && [self.errs count] > 0) {
		return [self.errs objectAtIndex:0];
	}
	return nil;
}

+ (NSError *)toError:(CommonBasicResponseDTO *)response
{
	NSMutableDictionary* dtls = [NSMutableDictionary dictionary];
	for (NSString* err in response.errs) {
		[dtls setValue:err forKey:NSLocalizedDescriptionKey];
	}
	NSError* err = [NSError errorWithDomain:ERR_DOMAIN code:response.resultCode userInfo:dtls];
	return err;
}

@end
