#import "CBDView.h"

@interface SBIconListView : UIView

@property (nonatomic, assign) BOOL configured;
-(void)layoutIconsNow;

@end


@interface SBRootIconListView : SBIconListView

@end


@interface SBIconView : UIView

-(void)setLabelAccessoryViewHidden:(BOOL)arg1 ;

@end

@interface SBIconController : UIViewController

@property (nonatomic, strong) CBDView *cbdView;
+(id)sharedInstance;
-(BOOL)isEditing;
-(BOOL)relayout;
-(void)setIsEditing:(BOOL)arg1;
-(long long)currentIconListIndex;
-(SBRootIconListView *)rootIconListAtIndex:(long long)arg1 ;
-(NSTimer *)editingEndTimer;

@end

@interface _UIStatusBar : UIView

@end
@interface UIStatusBar : UIView

@end

@interface SBEditingDoneButton : UIView

@end


@interface SBIconListGridLayoutConfiguration

@property (nonatomic, assign) NSString *iconLocation;
@property (nonatomic, retain) NSDictionary *managerValues;
@property (nonatomic, assign) UIEdgeInsets customInsets;

- (void)getLatestValuesFromManager;
- (NSString *)locationIfKnown;
- (NSUInteger)numberOfPortraitColumns;
- (NSUInteger)numberOfPortraitRows;
- (UIEdgeInsets)portraitLayoutInsets;
@end

@interface SBIconListLayout : NSObject
- (SBIconListGridLayoutConfiguration *)layoutConfiguration;
@end


@interface SBIconListFlowLayout : SBIconListLayout
@end