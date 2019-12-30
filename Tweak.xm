#import "Tweak.h"
#import "CBDManager.h"

%hook SBRootFolderController

-(void)setEditingStatusBarAssertion:(id)arg1 {

}

%end

%hook SBEditingDoneButton

- (id)initWithFrame:(struct CGRect)arg1 {
	return NULL;
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
	/*
	if ([[CBDManager sharedInstance] hideIconLabels] || [[CBDManager sharedInstance] hideIconDots]) {
		[self setLabelAccessoryViewHidden:YES];
	}*/
}

%end

%hook SBRootIconListView

%property (nonatomic, assign) BOOL configured;

- (void)layoutSubviews 
{
    %orig;

    if (!self.configured) 
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutIconsNow) name:@"CBDrelayoutAll" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(relayoutAllAnimated) name:@"CBDrelayoutAllAnimated" object:nil];

        self.configured = YES;
    }
}

%new
-(void)relayoutAllAnimated
{
	[UIView animateWithDuration:(0.15) delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		[self layoutIconsNow];
	} completion:^(BOOL whatever) {
	}];
}

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


%hook UIStatusBar

-(instancetype)initWithFrame:(CGRect)frame 
{
	self = %orig(frame);
	[self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cbdShowView)]];
	return self;
}

-(instancetype)initWithStyle:(NSInteger)style 
{
	self = %orig(style);
	[self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cbdShowView)]];
	return self;
}

%new
-(void)cbdShowView {
	[[CBDManager sharedInstance].view setPresented:YES];
	if ([[%c(SBIconController) sharedInstance] isEditing]) {
		[[[%c(SBIconController) sharedInstance] editingEndTimer] invalidate];
		[[CBDManager sharedInstance].view setPresented:YES];
	}
}

%end


%hook _UIStatusBar

-(instancetype)initWithFrame:(CGRect)frame 
{
	self = %orig(frame);
	[self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cbdShowView)]];
	return self;
}

-(instancetype)initWithStyle:(NSInteger)style 
{
	self = %orig(style);
	[self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cbdShowView)]];
	return self;
}

%new
-(void)cbdShowView {
	[[CBDManager sharedInstance].view setPresented:YES];
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


%hook SBIconListView

%property (nonatomic, assign) BOOL configured;

- (void)layoutSubviews 
{
    %orig;

    if (!self.configured) 
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutIconsNow) name:@"CBDrelayoutAll" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(relayoutAllAnimated) name:@"CBDrelayoutAllAnimated" object:nil];

        self.configured = YES;
    }
}

%new
-(void)relayoutAllAnimated
{
	[UIView animateWithDuration:(0.15) delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		[self layoutIconsNow];
	} completion:^(BOOL whatever) {
	}];
}
- (BOOL)automaticallyAdjustsLayoutMetricsToFit
{
    // Allows us to adjust dock
    return NO;
}
%end

%hook SBIconListFlowLayout
-(NSUInteger)numberOfRowsForOrientation:(NSInteger)arg1
{
	if ([[CBDManager sharedInstance] homescreenRows] > 0) return [[self layoutConfiguration] numberOfPortraitRows];
	return %orig(arg1);
}

-(NSUInteger)numberOfColumnsForOrientation:(NSInteger)arg1
{
	if ([[CBDManager sharedInstance] homescreenColumns] > 0) return[[self layoutConfiguration] numberOfPortraitColumns] ;
	return %orig(arg1);
}
%end

%hook SBIconListGridLayoutConfiguration 
// top left bottom right 



-(NSUInteger)numberOfPortraitRows
{
	NSUInteger rows = MSHookIvar<NSUInteger>(self, "_numberOfPortraitRows");
	NSUInteger columns = MSHookIvar<NSUInteger>(self, "_numberOfPortraitColumns");
	if (!(rows > 3 && columns == 4))
	{
		return %orig;
	}
	if ([[CBDManager sharedInstance] homescreenRows] > 0) return [[CBDManager sharedInstance] homescreenRows];
	return %orig;
}

-(NSUInteger)numberOfPortraitColumns
{
	NSUInteger rows = MSHookIvar<NSUInteger>(self, "_numberOfPortraitRows");
	NSUInteger columns = MSHookIvar<NSUInteger>(self, "_numberOfPortraitColumns");
	if (!(rows > 3 && columns == 4))
	{
		return %orig;
	}
	if ([[CBDManager sharedInstance] homescreenColumns] > 0) return [[CBDManager sharedInstance] homescreenColumns];
	return %orig;
}
-(void)setNumberOfPortraitRows:(NSUInteger)arg 
{	
	NSUInteger rows = MSHookIvar<NSUInteger>(self, "_numberOfPortraitRows");
	NSUInteger columns = MSHookIvar<NSUInteger>(self, "_numberOfPortraitColumns");
	if (!(rows > 3 && columns == 4))
	{
		%orig(arg);
		return;
	}
	if ([[CBDManager sharedInstance] homescreenRows] > 0) %orig([[CBDManager sharedInstance] homescreenRows]);
	else %orig(arg);
}
-(void)setNumberOfPortraitColumns:(NSUInteger)arg 
{
	NSUInteger rows = MSHookIvar<NSUInteger>(self, "_numberOfPortraitRows");
	NSUInteger columns = MSHookIvar<NSUInteger>(self, "_numberOfPortraitColumns");
	if (!(rows > 3 && columns == 4))
	{
		%orig(arg);
		return;
	}
	if ([[CBDManager sharedInstance] homescreenColumns] > 0) %orig([[CBDManager sharedInstance] homescreenColumns]);
	else %orig(arg);
}

-(UIEdgeInsets)portraitLayoutInsets
{
    UIEdgeInsets x = %orig;

	NSUInteger rows = MSHookIvar<NSUInteger>(self, "_numberOfPortraitRows");
	NSUInteger columns = MSHookIvar<NSUInteger>(self, "_numberOfPortraitColumns");
	if (!(rows > 3 && columns == 4))
	{
		return x;
	}

    BOOL leftInsetZeroed = [[CBDManager sharedInstance] horizontalOffset] == 0;
    if (!leftInsetZeroed)
    {
        return UIEdgeInsetsMake(
            x.top + [[CBDManager sharedInstance] verticalOffset],
            x.left + [[CBDManager sharedInstance] horizontalOffset],
            x.bottom - [[CBDManager sharedInstance] verticalOffset] + [[CBDManager sharedInstance] verticalPadding]*2, // * 2 because regularly it was too slow
            x.right - [[CBDManager sharedInstance] horizontalOffset] + [[CBDManager sharedInstance] horizontalPadding]*2
        );
    }
    else
    {
        return UIEdgeInsetsMake(
            x.top + [[CBDManager sharedInstance] verticalOffset],
            x.left + [[CBDManager sharedInstance] horizontalPadding]*-2,
            x.bottom - [[CBDManager sharedInstance] verticalOffset] + [[CBDManager sharedInstance] verticalPadding]*-2, // * 2 because regularly it was too slow
            x.right + [[CBDManager sharedInstance] horizontalPadding]*-2
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
	} 
    else 
    {
		%init(iOS13);
	}
}
