#import <Foundation/Foundation.h>
#import "CommonBasicResponseDTO.h"

@interface CommonBaseHttpService : NSObject

+ (NSMutableURLRequest*)newPostReq:(NSURL*)url :(NSString*)body;

+ (CommonBasicResponseDTO*)markInternalErrorResponse:(NSError*)error;

@end
