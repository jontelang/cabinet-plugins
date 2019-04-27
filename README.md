![logo](images/cabinetkit.png)	

#CabinetKit

Documentation for creating plugins for Cabinet.

## Cabinet

'Cabinet' is an app for jailbroken iOS devices. The base version acts as an App Drawer where all of the users applications are installed. It is however extendable and you can add new data, examples in this page include adding FlipSwitches and snaps taken from 'Snapper 2'.

Read more about Cabinet [here](). **<font color=red><--TODO: add link</font>**

## Getting started

These items will help you with creating a plugin

- The app itself, to test stuff out. 
- NIC template will help you create the files. Just put it into your `theos/templates` path and run `nic.pl` as usual.
- The header files for the `CabinetDataSource` protocol.

## 30 second overview

'Cabinet' is, to keep it simple, a container for one-or-more `UICollectionView`s, your job is to implement a datasource. A datasource is a simple `NSObject <CabinetDataSource>` and will need to implement some items such as the data, amount of cells, sections and what images/text to show within them. The tweak itself will load it all and handle the displaying, etc.

*There are more advanced features but that's the gist of it.*

## The CabinetDataSource protocol

    @protocol CabinetDataSourceProtocol <NSObject>
    
    @required
    -(NSInteger)sectionCount;
    -(NSInteger)itemCountForSection:(NSInteger)section;
    -(NSDictionary*)appForIndexPath:(NSIndexPath*)indexPath;
    
    @optional
    -(NSString*)titleForSection:(NSInteger)section;
    -(void)doActionForIndexPath:(NSIndexPath*)indexPath;
    -(CGSize)sizeForCells;
    
    @end
    
**`sectionCount`** simply returns the amount of sections, you should probably keep this to 1.

**`itemCountForSection:`** similar to the `sectionCount` this should return the amount of objects that you want to display.

**`appForIndexPath:`** should return a `NSDictionary` with data that is to be displayed in the cells in 'Cabinet'. The values are as following:

Key | Type | Description
------------ | ------------- | ------------
name | NSString  | The items label will display this value. Keeping it short is preferred if the `sizeForCells` method is not implemented to return a wide cell.
image | UIImage  | Each cell have a `UIImageView` and the image specified will be added into that.
labelAlpha | NSNumber  | You can change the alpha of the cells label via this value. Keep between 0 and 1.
contentview | UIView | If you do not want to have just an image and label, you are welcome to send your own custom `UIView` into the cell.

**`titleForSection:`** (optional) returns the title for the section. Can be `nil`. May be used to section off your items if you have multiple ones. An example could be, if you want to section items into alphabetized sections each title would return A/B/C/D/Etc.

**`doActionForIndexPath:`** (optional but probably good to implement). Will run whatever code when pressing the cell. It is up to you to write the code for what happens when you press your items. If you implement this method you probably also want to implement `dismissCabinetAfterAction`.

If you added your own `UIView`, for example an `UIButton` into the cells via the key `contentview`. They can respond to their own actions as they become the first responders.

**`sizeForCells`** (optional) overriding this will change the size of the cells. Defaults to `{60,60}`.

**`dismissCabinetAfterAction`** (optional) if you want to dismiss the view after pressing some action you should return `YES` from this method. Default is `NO`. 

If you want to only dismiss after pressing certain cells, I guess you can add an ivar to return here that you change around.

## Example plugins

You can see actual implemented plugins in the [plugins directory](sasd).

## MetaData

**Naming.** Please name the plugins like "CabinetPluginYourPluginName" to keep them organised in Cydia. Obviously I can't force you to do this but.. please?

There is a `Info.plist` in the generated (NIC) project. It contains a key named `PreferencesTitle` which will be used within the Settings.app where users will enabled or disable the plugin. So if you named the tweak "CabinetPluginYourPluginName" this value should be something like "YourPluginName" or "Your Plugin Name".

**Descriptions.** blah a key in infoplist .. 

**Icon.** Icon for settings blahe bleh icon@2x.png 58x58

**Author.**  for settings blahe bleh

**AuthorEmail.** keep in the settings plaablalblalb

## Things to nor forget

Don't forget to



## Getting Help

jontelang@gmail.com