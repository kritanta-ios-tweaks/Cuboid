
#define LLT_REFRESH @"LLTRefreshLayout"
#define LLT_UPDATE @"LLTUpdateCache"
#define LLT_REFRESH_ANIMATED @"LLTRefreshLayoutAnimated"
@interface LLTLayoutProvider : NSObject

@property (assign) NSInteger priority;

@property (strong) NSString *iconLocation;
@property (strong) NSDictionary *items;

@end
@interface LLTServer : NSObject

+(NSNumber *)valueForItem:(NSString *)item forLocation:(NSString *)location;
+(void)registerProvider:(LLTLayoutProvider *)provider;
+(LLTLayoutProvider *)createProviderFor:(NSString *)iconLocation
                withTopInset:(CGFloat *)topInset 
                sideInset:(CGFloat *)sideInset 
               pageOffset:(CGFloat *)pageOffset 
        horizontalSpacing:(CGFloat *)horizontalSpacing
          verticalSpacing:(CGFloat *)verticalSpacing
                     rows:(CGFloat *)rows
                  columns:(CGFloat *)columns;

@end