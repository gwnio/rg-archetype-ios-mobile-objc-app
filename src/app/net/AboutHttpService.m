#import "AboutHttpService.h"
#import "CommonPagingLoadListResult.h"

@implementation AboutHttpService

+ (CommonBasicResponseDTO *)getFavoriteColors :(int)offset :(int)limit
{
	NSMutableArray *data = [[NSMutableArray alloc] init];
	[data addObject:@"Red"];
	[data addObject:@"Yellow"];
	[data addObject:@"Black"];
	[data addObject:@"White"];
	
	int dataLength = (int)[data count];
	
	CommonPagingLoadListResult *pagingLoadListResult = [[CommonPagingLoadListResult alloc] init];
	pagingLoadListResult.firstResult = offset;
	pagingLoadListResult.maxResults = limit;
	pagingLoadListResult.totalResults = dataLength;
	if ((offset + limit) >= dataLength) {
		if (offset >= dataLength) {
			pagingLoadListResult.data = @[];
		} else {
			pagingLoadListResult.data = [data subarrayWithRange:NSMakeRange(offset, ((offset + limit) - dataLength - 1))];
		}
	} else {
		pagingLoadListResult.data = [data subarrayWithRange:NSMakeRange(offset, limit)];
	}
	
	CommonBasicResponseDTO *dto = [[CommonBasicResponseDTO alloc] init];
	dto.resultCode = CommonBasicResponseResultOk;
	dto.data = pagingLoadListResult;
	return dto;
}

@end
