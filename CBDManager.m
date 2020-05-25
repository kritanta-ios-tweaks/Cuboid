#import "CBDManager.h"
#import "Tweak.h"
#include "liblayout.h"

@implementation CBDManager
@synthesize homescreenColumns = _homescreenColumns;
@synthesize homescreenRows = _homescreenRows;
@synthesize verticalOffset = _verticalOffset;
@synthesize horizontalOffset = _horizontalOffset;
@synthesize verticalPadding = _verticalPadding;
@synthesize horizontalPadding = _horizontalPadding;
+(instancetype)sharedInstance {
    static CBDManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CBDManager alloc];
        sharedInstance.defaults = [NSUserDefaults standardUserDefaults];
        sharedInstance.savedLayouts = [NSMutableDictionary new];
        [sharedInstance load];
    });
    return sharedInstance;
}

-(id)init {
    return [CBDManager sharedInstance];
}

-(void)load {
    self.hideIconLabels = [self.defaults boolForKey:@"hideIconLabels"];
    self.hideIconDots = [self.defaults boolForKey:@"hideIconDots"];
    homescreenColumns = [self.defaults integerForKey:@"homescreenColumns"];
    homescreenRows = [self.defaults integerForKey:@"homescreenRows"];
    verticalOffset = [self.defaults floatForKey:@"verticalOffset"];
    horizontalOffset = [self.defaults floatForKey:@"horizontalOffset"];
    verticalPadding = [self.defaults floatForKey:@"verticalPadding"];
    horizontalPadding = [self.defaults floatForKey:@"horizontalPadding"];

    [LLTServer registerProvider:
        [LLTServer createProviderFor:@"SBIconLocationRoot"
                        withTopInset:&verticalOffset
                           sideInset:&verticalOffset
                          pageOffset:&verticalOffset
                   horizontalSpacing:&horizontalPadding
                     verticalSpacing:&verticalPadding
                                rows:&homescreenRows
                             columns:&homescreenColumns]
    ];

    NSDictionary *savedLayouts = [self.defaults objectForKey:@"savedLayouts"];
    if (savedLayouts && [savedLayouts isKindOfClass:[NSDictionary class]]) {
        self.savedLayouts = [savedLayouts mutableCopy];
    }
}

-(void)save {
    [self.defaults setBool:self.hideIconLabels forKey:@"hideIconLabels"];
    [self.defaults setBool:self.hideIconDots forKey:@"hideIconDots"];
    [self.defaults setInteger:homescreenColumns forKey:@"homescreenColumns"];
    [self.defaults setInteger:homescreenRows forKey:@"homescreenRows"];
    [self.defaults setFloat:verticalOffset forKey:@"verticalOffset"];
    [self.defaults setFloat:horizontalOffset forKey:@"horizontalOffset"];
    [self.defaults setFloat:verticalPadding forKey:@"verticalPadding"];
    [self.defaults setFloat:horizontalPadding forKey:@"horizontalPadding"];
    [self.defaults setObject:self.savedLayouts forKey:@"savedLayouts"];
    [self.defaults synchronize];
}

-(void)reset {
    self.hideIconLabels = NO;
    self.hideIconDots = NO;
    homescreenColumns = 0;
    homescreenRows = 0;
    verticalOffset = 0;
    horizontalOffset = 0;
    verticalPadding = 0;
    horizontalPadding = 0;
    [self save];
    [self relayoutAllAnimated];
}

-(void)relayout {
    [[NSNotificationCenter defaultCenter] postNotificationName:LLT_REFRESH object:nil];
}

-(void)relayoutAll {
    [[NSNotificationCenter defaultCenter] postNotificationName:LLT_REFRESH object:nil];
    [self.view.superview bringSubviewToFront:self.view];
}

-(void)relayoutAllAnimated {	
    [[NSNotificationCenter defaultCenter] postNotificationName:LLT_REFRESH_ANIMATED object:nil];
}

-(void)loadLayoutWithName:(NSString *)name {
    if (!self.savedLayouts[name]) return;
    NSDictionary *layout = self.savedLayouts[name];
    self.hideIconLabels      = layout[@"hideIconLabels"]      ? [layout[@"hideIconLabels"] isEqualToString:@"YES"]  : NO;
    self.hideIconDots        = layout[@"hideIconDots"]        ? [layout[@"hideIconDots"] isEqualToString:@"YES"]    : NO;
    homescreenColumns   = layout[@"homescreenColumns"]   ? [layout[@"homescreenColumns"] floatValue]             : 0;
    homescreenRows      = layout[@"homescreenRows"]      ? [layout[@"homescreenRows"] floatValue]                : 0;
    verticalOffset      = layout[@"verticalOffset"]      ? [layout[@"verticalOffset"] floatValue]              : 0;
    horizontalOffset    = layout[@"horizontalOffset"]    ? [layout[@"horizontalOffset"] floatValue]            : 0;
    verticalPadding     = layout[@"verticalPadding"]     ? [layout[@"verticalPadding"] floatValue]             : 0;
    horizontalPadding   = layout[@"horizontalPadding"]   ? [layout[@"horizontalPadding"] floatValue]           : 0;
    [self relayoutAllAnimated];
}

-(NSDictionary *)currentSettingsAsDictionary {
    return @{
        @"hideIconLabels": self.hideIconLabels ? @"YES" : @"NO",
        @"hideIconDots": self.hideIconDots ? @"YES" : @"NO",
        @"homescreenColumns": [NSString stringWithFormat:@"%.1f", homescreenColumns],
        @"homescreenRows": [NSString stringWithFormat:@"%.1f", homescreenRows],
        @"verticalOffset": [NSString stringWithFormat:@"%.1f", verticalOffset],
        @"horizontalOffset": [NSString stringWithFormat:@"%.1f", horizontalOffset],
        @"verticalPadding": [NSString stringWithFormat:@"%.1f", verticalPadding],
        @"horizontalPadding": [NSString stringWithFormat:@"%.1f", horizontalPadding],
    };
}

-(NSString *)layoutDescription:(NSDictionary *)layout {
    return [NSString stringWithFormat:@"Hide icon labels: %@\nHomescreen columns: %@\nHomescreen rows: %@\nVertical offset: %@\nHorizontal offset: %@\nVertical padding: %@\nHorizontal padding: %@",
        layout[@"hideIconLabels"],
        layout[@"homescreenColumns"],
        layout[@"homescreenRows"],
        layout[@"verticalOffset"],
        layout[@"horizontalOffset"],
        layout[@"verticalPadding"],
        layout[@"horizontalPadding"]
    ];
}

-(void)saveLayoutWithName:(NSString *)name {
    self.savedLayouts[name] = [self currentSettingsAsDictionary];
    [self save];
}

-(void)deleteLayoutWithName:(NSString *)name {
    [self.savedLayouts removeObjectForKey:name];
    [self save];
}

-(void)renameLayoutWithName:(NSString *)name toName:(NSString *)newName {
    self.savedLayouts[newName] = self.savedLayouts[name];
    [self.savedLayouts removeObjectForKey:name];
    [self save];
}

-(void)deleteAllLayouts {
    self.savedLayouts = [NSMutableDictionary new];
    [self save];
}

-(void)stopEditing {
    //SBIconController *iconController = [NSClassFromString(@"SBIconController") sharedInstance];
    //[iconController setIsEditing:NO];
}

-(void)presentViewController:(UIViewController*)viewController animated:(BOOL)animated completion:(id)completion {
    SBIconController *iconController = [NSClassFromString(@"SBIconController") sharedInstance];
    [iconController presentViewController:viewController animated:animated completion:completion];
}

@end