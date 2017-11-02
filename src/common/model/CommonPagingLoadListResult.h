#import "JSONModel.h"

@interface CommonPagingLoadListResult : JSONModel

@property (nonatomic) int firstResult;
@property (nonatomic) int maxResults;
@property (nonatomic) int totalResults;
@property NSArray* data;

@end
