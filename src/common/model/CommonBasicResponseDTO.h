#import "JSONModel.h"

typedef NS_ENUM(NSInteger, CommonBasicResponseResult) {
	CommonBasicResponseResultCancel = 0,
	CommonBasicResponseResultOk = 1,
	CommonBasicResponseResultFail = 2
};

@interface CommonBasicResponseDTO : JSONModel

@property NSObject<Optional> *data;
@property int resultCode;
@property NSMutableArray *errs;

- (id)init:(CommonBasicResponseResult)result;

- (CommonBasicResponseResult)getResult;
- (void)setResult:(CommonBasicResponseResult)result;

- (void)addError:(NSString*)error;
- (NSString*)getFirstError;

+ (NSError *)toError:(CommonBasicResponseDTO *)response;

@end
