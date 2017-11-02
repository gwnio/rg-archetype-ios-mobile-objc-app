

## Libraries

* JSONModel
* SWRevealViewController
* Google Analytics
* NSNotification
* SVPullToRefresh

## Configurations

Link libraries or add a "default import" to each class or source file.
Go to Project Target -> Build Phases and add the library to **Link Binary With Libraries**
i.e.
To add **#import <UIKit/UIKit.h>** to each class file link **<iOS version>/UIKit.framework**

## Highlights

* UITableView:
 * Loading indicator
 * Pull down refresh
* On left and right side, swipe to open menus

## Google Analytics

### Configuration

Google Analytics depends on the following libraries (add the library to **Link Binary With Libraries**):
CoreData.framework
SystemConfiguration.framework
libz.tbd
libsqlite3.0.tbd
libGoogleAnalyticsServices.a

### Tracking Id

If you go to Info.plist you will notice a entry **GoogleAnalyticsTrackingId** whose value is a user defined variable.
The user defined variable can be found under the Project Target -> Build Settings -> User-Defined.

### Activity Tracker

See AppActivityTracker.h for a helper class to log app usage using Google Analytics.  Also see AboutNameViewController.m for example usage of app usage tracking.

## Events

For example search NSNotificationCenter.
