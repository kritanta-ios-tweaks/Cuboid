#line 1 "Tweak.xm"
#import "Tweak.h"
#import "CBDManager.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBIconView; @class SBRootIconListView; @class _UIStatusBar; @class SBRootFolderController; @class SpringBoard; @class SBIconController; @class UIStatusBar; @class SBEditingDoneButton; @class SBIconLegibilityLabelView; 
static void (*_logos_orig$_ungrouped$SBRootFolderController$setEditingStatusBarAssertion$)(_LOGOS_SELF_TYPE_NORMAL SBRootFolderController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SBRootFolderController$setEditingStatusBarAssertion$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$SBEditingDoneButton$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBEditingDoneButton* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBEditingDoneButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBEditingDoneButton* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBIconLegibilityLabelView$setHidden$)(_LOGOS_SELF_TYPE_NORMAL SBIconLegibilityLabelView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBIconLegibilityLabelView$setHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconLegibilityLabelView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$SBIconView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBIconView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBRootIconListView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBRootIconListView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBRootIconListView$relayoutAllAnimated(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static NSUInteger (*_logos_meta_orig$_ungrouped$SBRootIconListView$iconColumnsForInterfaceOrientation$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSInteger); static NSUInteger _logos_meta_method$_ungrouped$SBRootIconListView$iconColumnsForInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSInteger); static NSUInteger (*_logos_meta_orig$_ungrouped$SBRootIconListView$iconRowsForInterfaceOrientation$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSInteger); static NSUInteger _logos_meta_method$_ungrouped$SBRootIconListView$iconRowsForInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSInteger); static CGFloat (*_logos_orig$_ungrouped$SBRootIconListView$topIconInset)(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$_ungrouped$SBRootIconListView$topIconInset(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat (*_logos_orig$_ungrouped$SBRootIconListView$bottomIconInset)(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$_ungrouped$SBRootIconListView$bottomIconInset(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat (*_logos_orig$_ungrouped$SBRootIconListView$sideIconInset)(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$_ungrouped$SBRootIconListView$sideIconInset(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat (*_logos_orig$_ungrouped$SBRootIconListView$verticalIconPadding)(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$_ungrouped$SBRootIconListView$verticalIconPadding(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat (*_logos_orig$_ungrouped$SBRootIconListView$horizontalIconPadding)(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$_ungrouped$SBRootIconListView$horizontalIconPadding(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST, SEL); static UIStatusBar* (*_logos_orig$_ungrouped$UIStatusBar$initWithFrame$)(_LOGOS_SELF_TYPE_INIT UIStatusBar*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static UIStatusBar* _logos_method$_ungrouped$UIStatusBar$initWithFrame$(_LOGOS_SELF_TYPE_INIT UIStatusBar*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static UIStatusBar* (*_logos_orig$_ungrouped$UIStatusBar$initWithStyle$)(_LOGOS_SELF_TYPE_INIT UIStatusBar*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static UIStatusBar* _logos_method$_ungrouped$UIStatusBar$initWithStyle$(_LOGOS_SELF_TYPE_INIT UIStatusBar*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$UIStatusBar$cbdShowView(_LOGOS_SELF_TYPE_NORMAL UIStatusBar* _LOGOS_SELF_CONST, SEL); static _UIStatusBar* (*_logos_orig$_ungrouped$_UIStatusBar$initWithFrame$)(_LOGOS_SELF_TYPE_INIT _UIStatusBar*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static _UIStatusBar* _logos_method$_ungrouped$_UIStatusBar$initWithFrame$(_LOGOS_SELF_TYPE_INIT _UIStatusBar*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static _UIStatusBar* (*_logos_orig$_ungrouped$_UIStatusBar$initWithStyle$)(_LOGOS_SELF_TYPE_INIT _UIStatusBar*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static _UIStatusBar* _logos_method$_ungrouped$_UIStatusBar$initWithStyle$(_LOGOS_SELF_TYPE_INIT _UIStatusBar*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$_UIStatusBar$cbdShowView(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBIconController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBIconController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBIconController$viewDidLayoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBIconController$viewDidLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBIconController$setIsEditing$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBIconController$setIsEditing$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static long long (*_logos_orig$_ungrouped$SpringBoard$homeScreenRotationStyle)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static long long _logos_method$_ungrouped$SpringBoard$homeScreenRotationStyle(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SpringBoard$homeScreenRotationStyleWantsUIKitRotation)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SpringBoard$homeScreenRotationStyleWantsUIKitRotation(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SpringBoard$homeScreenSupportsRotation)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SpringBoard$homeScreenSupportsRotation(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBIconController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBIconController"); } return _klass; }
#line 4 "Tweak.xm"


static void _logos_method$_ungrouped$SBRootFolderController$setEditingStatusBarAssertion$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}





static void _logos_method$_ungrouped$SBEditingDoneButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBEditingDoneButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBEditingDoneButton$layoutSubviews(self, _cmd);
	self.hidden = 1;
}





static void _logos_method$_ungrouped$SBIconLegibilityLabelView$setHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconLegibilityLabelView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	if ([[CBDManager sharedInstance] hideIconLabels]) _logos_orig$_ungrouped$SBIconLegibilityLabelView$setHidden$(self, _cmd, YES);
	else _logos_orig$_ungrouped$SBIconLegibilityLabelView$setHidden$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$SBIconView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBIconView$layoutSubviews(self, _cmd);
	



}





__attribute__((used)) static BOOL _logos_method$_ungrouped$SBRootIconListView$configured(SBRootIconListView * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBRootIconListView$configured); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$_ungrouped$SBRootIconListView$setConfigured(SBRootIconListView * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBRootIconListView$configured, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }


static void _logos_method$_ungrouped$SBRootIconListView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd)  {
    _logos_orig$_ungrouped$SBRootIconListView$layoutSubviews(self, _cmd);

    if (!self.configured) 
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutIconsNow) name:@"CBDrelayoutAll" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(relayoutAllAnimated) name:@"CBDrelayoutAllAnimated" object:nil];

        self.configured = YES;
    }
}



static void _logos_method$_ungrouped$SBRootIconListView$relayoutAllAnimated(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[UIView animateWithDuration:(0.15) delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		[self layoutIconsNow];
	} completion:^(BOOL whatever) {
	}];
}

static NSUInteger _logos_meta_method$_ungrouped$SBRootIconListView$iconColumnsForInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSInteger arg1){
	if ([[CBDManager sharedInstance] homescreenColumns] > 0) return [[CBDManager sharedInstance] homescreenColumns];
	return _logos_meta_orig$_ungrouped$SBRootIconListView$iconColumnsForInterfaceOrientation$(self, _cmd, arg1);
}

static NSUInteger _logos_meta_method$_ungrouped$SBRootIconListView$iconRowsForInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSInteger arg1){
	if ([[CBDManager sharedInstance] homescreenRows] > 0) return [[CBDManager sharedInstance] homescreenRows];
	return _logos_meta_orig$_ungrouped$SBRootIconListView$iconRowsForInterfaceOrientation$(self, _cmd, arg1);
}

static CGFloat _logos_method$_ungrouped$SBRootIconListView$topIconInset(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if ([[CBDManager sharedInstance] verticalOffset] != 0) return [[CBDManager sharedInstance] verticalOffset];
	return _logos_orig$_ungrouped$SBRootIconListView$topIconInset(self, _cmd);
}

static CGFloat _logos_method$_ungrouped$SBRootIconListView$bottomIconInset(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if ([[CBDManager sharedInstance] verticalOffset] != 0) return [[CBDManager sharedInstance] verticalOffset] * -1;
	return _logos_orig$_ungrouped$SBRootIconListView$bottomIconInset(self, _cmd);
}

static CGFloat _logos_method$_ungrouped$SBRootIconListView$sideIconInset(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if ([[CBDManager sharedInstance] horizontalOffset] != 0) return [[CBDManager sharedInstance] horizontalOffset];
	return _logos_orig$_ungrouped$SBRootIconListView$sideIconInset(self, _cmd);
}

static CGFloat _logos_method$_ungrouped$SBRootIconListView$verticalIconPadding(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if ([[CBDManager sharedInstance] verticalPadding] != 0) return [[CBDManager sharedInstance] verticalPadding];
	return _logos_orig$_ungrouped$SBRootIconListView$verticalIconPadding(self, _cmd);
}

static CGFloat _logos_method$_ungrouped$SBRootIconListView$horizontalIconPadding(_LOGOS_SELF_TYPE_NORMAL SBRootIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if ([[CBDManager sharedInstance] horizontalPadding] != 0) return [[CBDManager sharedInstance] horizontalPadding];
	return _logos_orig$_ungrouped$SBRootIconListView$horizontalIconPadding(self, _cmd);
}







static UIStatusBar* _logos_method$_ungrouped$UIStatusBar$initWithFrame$(_LOGOS_SELF_TYPE_INIT UIStatusBar* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED  {
	self = _logos_orig$_ungrouped$UIStatusBar$initWithFrame$(self, _cmd, frame);
	[self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cbdShowView)]];
	return self;
}


static UIStatusBar* _logos_method$_ungrouped$UIStatusBar$initWithStyle$(_LOGOS_SELF_TYPE_INIT UIStatusBar* __unused self, SEL __unused _cmd, NSInteger style) _LOGOS_RETURN_RETAINED  {
	self = _logos_orig$_ungrouped$UIStatusBar$initWithStyle$(self, _cmd, style);
	[self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cbdShowView)]];
	return self;
}


static void _logos_method$_ungrouped$UIStatusBar$cbdShowView(_LOGOS_SELF_TYPE_NORMAL UIStatusBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[[CBDManager sharedInstance].view setPresented:YES];
	if ([[_logos_static_class_lookup$SBIconController() sharedInstance] isEditing]) {
		[[[_logos_static_class_lookup$SBIconController() sharedInstance] editingEndTimer] invalidate];
		[[CBDManager sharedInstance].view setPresented:YES];
	}
}







static _UIStatusBar* _logos_method$_ungrouped$_UIStatusBar$initWithFrame$(_LOGOS_SELF_TYPE_INIT _UIStatusBar* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED  {
	self = _logos_orig$_ungrouped$_UIStatusBar$initWithFrame$(self, _cmd, frame);
	[self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cbdShowView)]];
	return self;
}


static _UIStatusBar* _logos_method$_ungrouped$_UIStatusBar$initWithStyle$(_LOGOS_SELF_TYPE_INIT _UIStatusBar* __unused self, SEL __unused _cmd, NSInteger style) _LOGOS_RETURN_RETAINED  {
	self = _logos_orig$_ungrouped$_UIStatusBar$initWithStyle$(self, _cmd, style);
	[self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cbdShowView)]];
	return self;
}


static void _logos_method$_ungrouped$_UIStatusBar$cbdShowView(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[[CBDManager sharedInstance].view setPresented:YES];
	if ([[_logos_static_class_lookup$SBIconController() sharedInstance] isEditing]) {
		[[[_logos_static_class_lookup$SBIconController() sharedInstance] editingEndTimer] invalidate];
		[[CBDManager sharedInstance].view setPresented:YES];
	}
}





__attribute__((used)) static CBDView * _logos_method$_ungrouped$SBIconController$cbdView(SBIconController * __unused self, SEL __unused _cmd) { return (CBDView *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBIconController$cbdView); }; __attribute__((used)) static void _logos_method$_ungrouped$SBIconController$setCbdView(SBIconController * __unused self, SEL __unused _cmd, CBDView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBIconController$cbdView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$_ungrouped$SBIconController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBIconController$viewDidLoad(self, _cmd);
	self.cbdView = [[CBDView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];

	[self.view addSubview:self.cbdView];
	[CBDManager sharedInstance].view = self.cbdView;
}

static void _logos_method$_ungrouped$SBIconController$viewDidLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBIconController$viewDidLayoutSubviews(self, _cmd);
	self.cbdView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.cbdView.frame.size.height);
}

static void _logos_method$_ungrouped$SBIconController$setIsEditing$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL isEditing) {
	_logos_orig$_ungrouped$SBIconController$setIsEditing$(self, _cmd, isEditing);
	if (!isEditing) [[CBDManager sharedInstance].view setPresented:NO];
}
















































































































































static long long _logos_method$_ungrouped$SpringBoard$homeScreenRotationStyle(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return 0;
}

static BOOL _logos_method$_ungrouped$SpringBoard$homeScreenRotationStyleWantsUIKitRotation(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}

static BOOL _logos_method$_ungrouped$SpringBoard$homeScreenSupportsRotation(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static __attribute__((constructor)) void _logosLocalCtor_f6f71130(int __unused argc, char __unused **argv, char __unused **envp) 
{
	dlopen("/usr/lib/liblayout.dylib", RTLD_NOW);
    {Class _logos_class$_ungrouped$SBRootFolderController = objc_getClass("SBRootFolderController"); MSHookMessageEx(_logos_class$_ungrouped$SBRootFolderController, @selector(setEditingStatusBarAssertion:), (IMP)&_logos_method$_ungrouped$SBRootFolderController$setEditingStatusBarAssertion$, (IMP*)&_logos_orig$_ungrouped$SBRootFolderController$setEditingStatusBarAssertion$);Class _logos_class$_ungrouped$SBEditingDoneButton = objc_getClass("SBEditingDoneButton"); MSHookMessageEx(_logos_class$_ungrouped$SBEditingDoneButton, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBEditingDoneButton$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBEditingDoneButton$layoutSubviews);Class _logos_class$_ungrouped$SBIconLegibilityLabelView = objc_getClass("SBIconLegibilityLabelView"); MSHookMessageEx(_logos_class$_ungrouped$SBIconLegibilityLabelView, @selector(setHidden:), (IMP)&_logos_method$_ungrouped$SBIconLegibilityLabelView$setHidden$, (IMP*)&_logos_orig$_ungrouped$SBIconLegibilityLabelView$setHidden$);Class _logos_class$_ungrouped$SBIconView = objc_getClass("SBIconView"); MSHookMessageEx(_logos_class$_ungrouped$SBIconView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBIconView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBIconView$layoutSubviews);Class _logos_class$_ungrouped$SBRootIconListView = objc_getClass("SBRootIconListView"); Class _logos_metaclass$_ungrouped$SBRootIconListView = object_getClass(_logos_class$_ungrouped$SBRootIconListView); MSHookMessageEx(_logos_class$_ungrouped$SBRootIconListView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBRootIconListView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBRootIconListView$layoutSubviews);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBRootIconListView, @selector(relayoutAllAnimated), (IMP)&_logos_method$_ungrouped$SBRootIconListView$relayoutAllAnimated, _typeEncoding); }MSHookMessageEx(_logos_metaclass$_ungrouped$SBRootIconListView, @selector(iconColumnsForInterfaceOrientation:), (IMP)&_logos_meta_method$_ungrouped$SBRootIconListView$iconColumnsForInterfaceOrientation$, (IMP*)&_logos_meta_orig$_ungrouped$SBRootIconListView$iconColumnsForInterfaceOrientation$);MSHookMessageEx(_logos_metaclass$_ungrouped$SBRootIconListView, @selector(iconRowsForInterfaceOrientation:), (IMP)&_logos_meta_method$_ungrouped$SBRootIconListView$iconRowsForInterfaceOrientation$, (IMP*)&_logos_meta_orig$_ungrouped$SBRootIconListView$iconRowsForInterfaceOrientation$);MSHookMessageEx(_logos_class$_ungrouped$SBRootIconListView, @selector(topIconInset), (IMP)&_logos_method$_ungrouped$SBRootIconListView$topIconInset, (IMP*)&_logos_orig$_ungrouped$SBRootIconListView$topIconInset);MSHookMessageEx(_logos_class$_ungrouped$SBRootIconListView, @selector(bottomIconInset), (IMP)&_logos_method$_ungrouped$SBRootIconListView$bottomIconInset, (IMP*)&_logos_orig$_ungrouped$SBRootIconListView$bottomIconInset);MSHookMessageEx(_logos_class$_ungrouped$SBRootIconListView, @selector(sideIconInset), (IMP)&_logos_method$_ungrouped$SBRootIconListView$sideIconInset, (IMP*)&_logos_orig$_ungrouped$SBRootIconListView$sideIconInset);MSHookMessageEx(_logos_class$_ungrouped$SBRootIconListView, @selector(verticalIconPadding), (IMP)&_logos_method$_ungrouped$SBRootIconListView$verticalIconPadding, (IMP*)&_logos_orig$_ungrouped$SBRootIconListView$verticalIconPadding);MSHookMessageEx(_logos_class$_ungrouped$SBRootIconListView, @selector(horizontalIconPadding), (IMP)&_logos_method$_ungrouped$SBRootIconListView$horizontalIconPadding, (IMP*)&_logos_orig$_ungrouped$SBRootIconListView$horizontalIconPadding);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$SBRootIconListView, @selector(configured), (IMP)&_logos_method$_ungrouped$SBRootIconListView$configured, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$SBRootIconListView, @selector(setConfigured:), (IMP)&_logos_method$_ungrouped$SBRootIconListView$setConfigured, _typeEncoding); } Class _logos_class$_ungrouped$UIStatusBar = objc_getClass("UIStatusBar"); MSHookMessageEx(_logos_class$_ungrouped$UIStatusBar, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$UIStatusBar$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$UIStatusBar$initWithFrame$);MSHookMessageEx(_logos_class$_ungrouped$UIStatusBar, @selector(initWithStyle:), (IMP)&_logos_method$_ungrouped$UIStatusBar$initWithStyle$, (IMP*)&_logos_orig$_ungrouped$UIStatusBar$initWithStyle$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$UIStatusBar, @selector(cbdShowView), (IMP)&_logos_method$_ungrouped$UIStatusBar$cbdShowView, _typeEncoding); }Class _logos_class$_ungrouped$_UIStatusBar = objc_getClass("_UIStatusBar"); MSHookMessageEx(_logos_class$_ungrouped$_UIStatusBar, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$_UIStatusBar$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$_UIStatusBar$initWithFrame$);MSHookMessageEx(_logos_class$_ungrouped$_UIStatusBar, @selector(initWithStyle:), (IMP)&_logos_method$_ungrouped$_UIStatusBar$initWithStyle$, (IMP*)&_logos_orig$_ungrouped$_UIStatusBar$initWithStyle$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$_UIStatusBar, @selector(cbdShowView), (IMP)&_logos_method$_ungrouped$_UIStatusBar$cbdShowView, _typeEncoding); }Class _logos_class$_ungrouped$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$_ungrouped$SBIconController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBIconController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBIconController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$SBIconController, @selector(viewDidLayoutSubviews), (IMP)&_logos_method$_ungrouped$SBIconController$viewDidLayoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBIconController$viewDidLayoutSubviews);MSHookMessageEx(_logos_class$_ungrouped$SBIconController, @selector(setIsEditing:), (IMP)&_logos_method$_ungrouped$SBIconController$setIsEditing$, (IMP*)&_logos_orig$_ungrouped$SBIconController$setIsEditing$);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(CBDView *)); class_addMethod(_logos_class$_ungrouped$SBIconController, @selector(cbdView), (IMP)&_logos_method$_ungrouped$SBIconController$cbdView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(CBDView *)); class_addMethod(_logos_class$_ungrouped$SBIconController, @selector(setCbdView:), (IMP)&_logos_method$_ungrouped$SBIconController$setCbdView, _typeEncoding); } Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(homeScreenRotationStyle), (IMP)&_logos_method$_ungrouped$SpringBoard$homeScreenRotationStyle, (IMP*)&_logos_orig$_ungrouped$SpringBoard$homeScreenRotationStyle);MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(homeScreenRotationStyleWantsUIKitRotation), (IMP)&_logos_method$_ungrouped$SpringBoard$homeScreenRotationStyleWantsUIKitRotation, (IMP*)&_logos_orig$_ungrouped$SpringBoard$homeScreenRotationStyleWantsUIKitRotation);MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(homeScreenSupportsRotation), (IMP)&_logos_method$_ungrouped$SpringBoard$homeScreenSupportsRotation, (IMP*)&_logos_orig$_ungrouped$SpringBoard$homeScreenSupportsRotation);}


}
