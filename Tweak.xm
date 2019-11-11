#import "Tweak.h"
#import "CBDManager.h"

%hook SBRootFolderController

-(void)setEditingStatusBarAssertion:(id)arg1 {}

%end

%hook SBEditingDoneButton

-(void)layoutSubviews {
	%orig;
	self.hidden = 1;
}

%end

%hook SBIconLegibilityLabelView

-(void)setHidden:(BOOL)arg1 {
	if ([[CBDManager sharedInstance] hideIconLabels]) %orig(YES);
	else %orig;
}

%end

%hook SBIconView

-(void)layoutSubviews {
	%orig;
	if ([[CBDManager sharedInstance] hideIconLabels] || [[CBDManager sharedInstance] hideIconDots]) {
		[self setLabelAccessoryViewHidden:YES];
	}
}

%end

%hook SBRootIconListView

+(NSUInteger)iconColumnsForInterfaceOrientation:(NSInteger)arg1{
	if ([[CBDManager sharedInstance] homescreenColumns] > 0) return [[CBDManager sharedInstance] homescreenColumns];
	return %orig;
}

+(NSUInteger)iconRowsForInterfaceOrientation:(NSInteger)arg1{
	if ([[CBDManager sharedInstance] homescreenRows] > 0) return [[CBDManager sharedInstance] homescreenRows];
	return %orig;
}

-(CGFloat)topIconInset {
	if ([[CBDManager sharedInstance] verticalOffset] != 0) return [[CBDManager sharedInstance] verticalOffset];
	return %orig;
}

-(CGFloat)bottomIconInset {
	if ([[CBDManager sharedInstance] verticalOffset] != 0) return [[CBDManager sharedInstance] verticalOffset] * -1;
	return %orig;
}

-(CGFloat)sideIconInset {
	if ([[CBDManager sharedInstance] horizontalOffset] != 0) return [[CBDManager sharedInstance] horizontalOffset];
	return %orig;
}

-(CGFloat)verticalIconPadding {
	if ([[CBDManager sharedInstance] verticalPadding] != 0) return [[CBDManager sharedInstance] verticalPadding];
	return %orig;
}

-(CGFloat)horizontalIconPadding {
	if ([[CBDManager sharedInstance] horizontalPadding] != 0) return [[CBDManager sharedInstance] horizontalPadding];
	return %orig;
}

%end

%hook UIStatusBarWindow

-(instancetype)initWithFrame:(CGRect)frame {
	self = %orig;
	[self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cbdShowView)]];
	return self;
}

%new
-(void)cbdShowView {
	if ([[%c(SBIconController) sharedInstance] isEditing]) {
		[[[%c(SBIconController) sharedInstance] editingEndTimer] invalidate];
		[[CBDManager sharedInstance].view setPresented:YES];
	}
}

%end

%hook SBIconController

%property (nonatomic, strong) CBDView *cbdView;

-(void)viewDidLoad {
	%orig;
	self.cbdView = [[CBDView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];

	[self.view addSubview:self.cbdView];
	[CBDManager sharedInstance].view = self.cbdView;
}

-(void)viewDidLayoutSubviews {
	%orig;
	self.cbdView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.cbdView.frame.size.height);
}

-(void)setIsEditing:(BOOL)isEditing {
	%orig;
	if (!isEditing) [[CBDManager sharedInstance].view setPresented:NO];
}

%end

%group iOS13


%hook SBIconListFlowLayout
-(NSUInteger)numberOfRowsForOrientation:(NSInteger)arg1
{
	if ([[CBDManager sharedInstance] homescreenRows] > 0) return [[CBDManager sharedInstance] homescreenRows];
}

-(NSUInteger)numberOfColumnsForOrientation:(NSInteger)arg1
{
	if ([[CBDManager sharedInstance] homescreenColumns] > 0) return [[CBDManager sharedInstance] homescreenColumns];
}
%end

%hook SBIconListGridLayoutConfiguration 
// top left bottom right 

-(NSUInteger)numberOfPortraitRows
{
	if ([[CBDManager sharedInstance] homescreenRows] > 0) return [[CBDManager sharedInstance] homescreenRows];
}

-(NSUInteger)numberOfPortraitColumns
{
	if ([[CBDManager sharedInstance] homescreenColumns] > 0) return [[CBDManager sharedInstance] homescreenColumns];
}
-(void)setNumberOfPortraitRows:(NSUInteger)arg 
{
	if ([[CBDManager sharedInstance] homescreenRows] > 0) %orig([[CBDManager sharedInstance] homescreenRows]);
	else %orig(arg);
}
-(void)setNumberOfPortraitColumns:(NSUInteger)arg 
{
	if ([[CBDManager sharedInstance] homescreenColumns] > 0) %orig([[CBDManager sharedInstance] homescreenColumns]);
	else %orig(arg);
}

-(UIEdgeInsets)portraitLayoutInsets
{
    UIEdgeInsets x = %orig;

    BOOL left_inset_will_misalign = [[CBDManager sharedInstance] horizontalOffset] < x.right;
    left_inset_will_misalign = (left_inset_will_misalign && [[CBDManager sharedInstance] horizontalOffset] != 0);
    BOOL leftInsetZeroed = [[CBDManager sharedInstance] horizontalOffset] == 0;
    if (!leftInsetZeroed)
    {
        return UIEdgeInsetsMake(
            [[CBDManager sharedInstance] verticalOffset],
            [[CBDManager sharedInstance] horizontalOffset],
            x.bottom - [[CBDManager sharedInstance] verticalOffset] + [[CBDManager sharedInstance] verticalPadding]*2, // * 2 because regularly it was too slow
            x.right - [[CBDManager sharedInstance] horizontalOffset] + [[CBDManager sharedInstance] horizontalPadding]*2
        );
    }
    else
    {
        return UIEdgeInsetsMake(
            [[CBDManager sharedInstance] verticalOffset],
            [[CBDManager sharedInstance] horizontalOffset],
            x.bottom - [[CBDManager sharedInstance] verticalOffset] + [[CBDManager sharedInstance] verticalPadding]*2, // * 2 because regularly it was too slow
            [[CBDManager sharedInstance] horizontalPadding]
        );
    }
}
%end

%end

/* Disable home screen rotation on + devices. */

%hook SpringBoard

- (long long)homeScreenRotationStyle {
	return 0;
}

-(BOOL)homeScreenRotationStyleWantsUIKitRotation {
	return NO;
}

-(BOOL)homeScreenSupportsRotation {
	return NO;
}

%end

%ctor 
{
    %init;

	if (kCFCoreFoundationVersionNumber < 1600) 
    {
        %init(pre13icons);
	} 
    else 
    {
		%init(iOS13);
	}
}