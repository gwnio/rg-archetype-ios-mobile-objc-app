#import "CommonBaseHttpService.h"
#import "CommonBasicResponseDTO.h"

@interface AboutHttpService : CommonBaseHttpService

+ (CommonBasicResponseDTO *)getFavoriteColors :(int)offset :(int)limit;

@end
