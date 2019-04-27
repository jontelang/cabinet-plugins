
// Replace this with your location
//#import "/Users/jontelang/Dropbox/Tweaks/cabinet/CabinetDataSource.h"

@interface @@PROJECTNAME@@ : NSObject <CabinetDataSourceProtocol>{
	NSArray *data;
}
@end

@implementation @@PROJECTNAME@@

// You should probably have a plain `init` method like this. So that you can store
// stuff into like an array or such so that Cabinet doesn't have to re-build or 
// look stuff up in realtime.
-(id)init{
  if(self==[super init]){
  	data = [@[@"test",@"data"] retain];
  }
  return self;
}

-(NSInteger)itemCount{
	[data count];
}

-(NSDictionary*)dataForIndex:(NSInteger)index{
	return @{ @"name" : [data objectAtIndex:indexPath.row] };
}

@end
