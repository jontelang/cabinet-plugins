///
/// flipswitches stuff
///
#import "lib/flipswitch/FSSwitchPanel.h"
#define TEMPLATE_BUNDLE_DARK  [[NSBundle alloc] initWithPath:@"/Library/Cabinet/Plugins/CabinetPluginFlipSwitches.bundle/template_dark.bundle"]
#define TEMPLATE_BUNDLE_LIGHT [[NSBundle alloc] initWithPath:@"/Library/Cabinet/Plugins/CabinetPluginFlipSwitches.bundle/template_light.bundle"]

// Replace this with your location
#import "/Users/jontelang/Dropbox/Tweaks/cabinet/CabinetDataSource.h"

@interface CabinetPluginFlipSwitches : NSObject <CabinetDataSourceProtocol>{
	NSArray *allIdentifiers;
}
@property (strong, retain) UICollectionView *collectionView;
@end

@implementation CabinetPluginFlipSwitches

-(id)init{
  if(self==[super init]){
	allIdentifiers = [[[FSSwitchPanel sharedPanel] sortedSwitchIdentifiers] retain];
	// So that we can change the labels to reflect the switch state
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(switchStateChanged:) name:FSSwitchPanelSwitchStateChangedNotification object:nil];
  }
  return self;
}

// Non datasource related

- (void)switchStateChanged:(NSNotification *)notification{
	// NSLog(@"switchStateChanged: %@", notification);
	NSString *changedIdentifier = [notification.userInfo objectForKey:FSSwitchPanelSwitchIdentifierKey];
	int count = 0;
	for ( NSString *identifierOfIndex in allIdentifiers ) {
		if( [changedIdentifier isEqualToString:identifierOfIndex] ){
			int row = count;
			if( self.collectionView ){
			    [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:row inSection:0]]]; 
			}
		}
		count++;
	}
}




-(NSInteger)itemCount{
  return [allIdentifiers count];
}

-(NSDictionary*)dataForIndex:(NSInteger)index{
  	NSString *identifier = [allIdentifiers objectAtIndex:index];
	NSString *name = [[FSSwitchPanel sharedPanel] titleForSwitchIdentifier:identifier];
	FSSwitchState state = [[FSSwitchPanel sharedPanel] stateForSwitchIdentifier:identifier];

	UIButton *tempButton = [[FSSwitchPanel sharedPanel] buttonForSwitchIdentifier:identifier usingTemplate:TEMPLATE_BUNDLE_DARK];
	[tempButton setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.25f]];
	[tempButton.layer setCornerRadius:12.0f];
	[tempButton setFrame:CGRectMake( 0, 0, 60, 60 )];

	return @{ @"contentView" : tempButton,
  				     @"name" : name,
			   @"labelAlpha" : state ? @1.0 : @0.5 };
}

-(BOOL)dismissCabinetAfterActionAtIndex:(NSInteger)index{
  return NO;
}

-(NSString*)titleForHeader{
  return @"FlipSwitches";
}

@end
