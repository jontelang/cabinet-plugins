
// Replace this with your location
#import "/Users/jontelang/Dropbox/Tweaks/cabinet/CabinetDataSource.h"
#include "/Users/jontelang/Dropbox/Tweaks/cabinet/AppList/AppList.h"

@interface UIApplication ()
-(BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end

@interface CabinetPluginAppList : NSObject <CabinetDataSourceProtocol>{
	NSArray *appsArray;
}
@end

@implementation CabinetPluginAppList

-(id)init{
    NSLog(@"cabinet applist");

    if(self==[super init]){
        // Build data
        NSDictionary *allAppDataDict = [self apps];
        NSArray *organisedNames = [[allAppDataDict allValues] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        NSMutableArray *tempOrganisedIdentifiers = [[NSMutableArray alloc] init];
        for ( NSString *name in organisedNames ){
            NSString *key = [[allAppDataDict  allKeysForObject:name] lastObject];
            NSDictionary *app = @{@"name":[self appNameForIdentifier:key],
                                  @"identifier":key,
                                  @"image":[self getImageIconForIdentifier:key]};
            [tempOrganisedIdentifiers addObject:app];
        }
        appsArray = [[NSArray alloc] initWithArray:tempOrganisedIdentifiers];
        [appsArray retain];

        NSLog(@"cabinet applist %@", appsArray);
    }
    return self;
}

-(NSInteger)itemCount{
    return [appsArray count];
}

-(NSDictionary*)dataForIndex:(NSInteger)index{
    return [appsArray objectAtIndex:index];
}

-(void)doActionForIndex:(NSInteger)index{
    NSDictionary *app = [appsArray objectAtIndex:index];
    NSString *identifier = [app objectForKey:@"identifier"];
    [[UIApplication sharedApplication] launchApplicationWithIdentifier:identifier suspended:NO];    
}

-(BOOL)dismissCabinetAfterActionAtIndex:(NSInteger)index{
    return YES;
}

-(NSString*)titleForHeader{
    return @"Applications";
}

















-(NSString*)appNameForIdentifier:(NSString*)identifier{
    NSDictionary *dict = [[ALApplicationList sharedApplicationList] applicationsFilteredUsingPredicate:Nil];
    NSString *name = [dict valueForKey:identifier];
    return name;
}

-(UIImage*)getImageIconForIdentifier:(NSString*)identifier{
    return [[ALApplicationList sharedApplicationList]
            iconOfSize:ALApplicationIconSizeLarge
            forDisplayIdentifier:identifier];
    //    SBIconController *ccc = (SBIconController*)[objc_getClass("SBIconController") sharedInstance];
    //    NSLog(@"ccc: %@", ccc);
    //    SBIconModel *mmm = [ccc valueForKey:@"_iconModel"];// MSHookIvar<SBIconModel*>(ccc,"_iconModel");
    //    NSLog(@"mmm: %@", mmm);
    //    SBApplicationIcon *appIcon;
    //
    //    if( [[UIDevice currentDevice].systemVersion floatValue] < 8.0f ){
    //        appIcon = [mmm applicationIconForDisplayIdentifier:identifier];// iOS 7
    //    }else{
    //        appIcon = [mmm applicationIconForBundleIdentifier:identifier];// iOS 8
    //    }
    //    return [appIcon getIconImage:2];
}

-(NSDictionary*)apps{
    NSMutableDictionary *dict = [[[ALApplicationList sharedApplicationList] applicationsFilteredUsingPredicate:Nil] mutableCopy];
    for ( NSString *str in [self hiddenDisplayIdentifiers] ){
        [dict removeObjectForKey:str];
    }
    return dict;
}

-(NSArray*)hiddenDisplayIdentifiers{
    return [[NSArray alloc] initWithObjects:@"com.apple.AdSheet",
            @"com.apple.AdSheetPhone",
            @"com.apple.AdSheetPad",
            @"com.apple.DataActivation",
            @"com.apple.DemoApp",
            @"com.apple.fieldtest",
            @"com.apple.iosdiagnostics",
            @"com.apple.iphoneos.iPodOut",
            @"com.apple.TrustMe",
            @"com.apple.WebSheet",
            @"com.apple.springboard",
            @"com.apple.purplebuddy",
            @"com.apple.datadetectors.DDActionsService",
            @"com.apple.FacebookAccountMigrationDialog",
            @"com.apple.iad.iAdOptOut",
            @"com.apple.ios.StoreKitUIService",
            @"com.apple.TextInput.kbd",
            @"com.apple.MailCompositionService",
            @"com.apple.mobilesms.compose",
            @"com.apple.quicklook.quicklookd",
            @"com.apple.ShoeboxUIService",
            @"com.apple.social.remoteui.SocialUIService",
            @"com.apple.WebViewService",
            @"com.apple.gamecenter.GameCenterUIService",
            @"com.apple.appleaccount.AACredentialRecoveryDialog",
            @"com.apple.AccountAuthenticationDialog",
            @"com.apple.Copilot",
            @"com.apple.CompassCalibrationViewService",
            @"com.apple.MusicUIService",
            @"com.apple.PassbookUIService",
            @"com.apple.uikit.PrintStatus",
            @"com.apple.WebContentFilter.remoteUI.WebContentAnalysisUI",
            @"com.apple.SiriViewService",
            // Added for iOS8 (Dupes?)
            @"com.apple.PassbookUIService",
            @"com.apple.PrintKit.Print-Center",
            @"com.apple.PhotosViewService",
            @"com.apple.MailCompositionService",
            @"com.apple.iad.iAdOptOut",
            @"com.apple.iphoneos.iPodOut",
            @"com.apple.appleaccount.AACredentialRecoveryDialog",
            @"com.apple.AccountAuthenticationDialog",
            @"com.apple.webapp",
            @"com.apple.AskPermissionUI",
            @"com.apple.TencentWeiboAccountMigrationDialog",
            @"com.apple.family",
            @"com.apple.purplebuddy",
            @"com.apple.mobilesms.notification",
            @"com.apple.ios.StoreKitUIService",
            @"com.apple.SiriViewService",
            @"com.apple.AdSheetPhone",
            @"com.apple.CompassCalibrationViewService",
            @"com.apple.GameController",
            @"com.apple.mobilesms.compose",
            @"com.apple.share",
            @"com.apple.fieldtest",
            @"com.apple.DemoApp",
            @"com.apple.SharedWebCredentialViewService",
            @"com.apple.WebSheet",
            @"com.apple.CoreAuthUI",
            @"com.apple.TrustMe",
            @"com.apple.WebViewService",
            @"com.apple.MobileStore",
            @"com.apple.FacebookAccountMigrationDialog",
            @"com.apple.MusicUIService",
            @"com.apple.iosdiagnostics",
            @"com.apple.webapp1",
            @"com.apple.datadetectors.DDActionsService",
            @"com.apple.PreBoard",
            @"com.apple.quicklook.quicklookd",
            @"com.apple.InCallService",
            @"com.apple.HealthPrivacyService",
            @"com.apple.gamecenter.GameCenterUIService",
            @"com.apple.Diagnostics",
            @"com.apple.WebContentFilter.remoteUI.WebContentAnalysisUI",
            @"com.apple.uikit.PrintStatus",
            // Added for ios9
            @"com.apple.Diagnostics.Mitosis",
            @"com.apple.Home.HomeUIService",
            @"com.apple.social.SLGoogleAuth",
            @"com.apple.social.SLYahooAuth",
            @"com.apple.SafariViewService",
            @"com.apple.ServerDocuments",
            @"com.apple.CloudKit.ShareBear",
            @"com.apple.StoreDemoViewService",
            // ??
            @"com.apple.MobileReplayer",
            nil];
}

@end
