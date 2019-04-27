
// Replace this with your location
#import "/Users/jontelang/Dropbox/Tweaks/cabinet/CabinetDataSource.h"

// I know this one because I know where they are in the snapper2 tweak
#define SNAPPER_THUMBS_PATH @"/var/mobile/Library/Snapper2/Thumbs/"

@interface CabinetPluginSnapper2 : NSObject <CabinetDataSourceProtocol>{
	NSMutableArray *thumbs;
}
@end

@implementation CabinetPluginSnapper2

-(id)init{
  if(self==[super init]){
    NSArray *files = [[[[NSFileManager defaultManager] contentsOfDirectoryAtPath:SNAPPER_THUMBS_PATH error:nil] reverseObjectEnumerator] allObjects];
    thumbs = [[NSMutableArray alloc] init];
    NSLog(@"files :%@", files);
    for( NSString *file in files ){
      NSLog(@"file :%@", file);
      NSString *filename = [NSString stringWithFormat:@"%@%@",SNAPPER_THUMBS_PATH,file];
      CGImageRef imageWithScaleOne = [UIImage imageWithContentsOfFile:filename].CGImage;
      UIImage *image = [[[UIImage alloc] initWithCGImage:imageWithScaleOne
                                                   scale:[UIScreen mainScreen].scale
                                             orientation:UIImageOrientationUp] autorelease];
      [thumbs addObject:@{@"image":image}];
    }
    [thumbs retain];
  }
  return self;
}

-(NSInteger)itemCount{
  return [thumbs count];
}

-(NSDictionary*)dataForIndex:(NSInteger)index{
  return [thumbs objectAtIndex:index];
}

-(BOOL)dismissCabinetAfterActionAtIndex:(NSInteger)index{
  return NO;
}

-(NSString*)titleForHeader{
  return @"Snapper 2";
}

@end
