# Keyboard

A keyboard Demo.

Add keyboard: Settings -> General -> Keyboard -> Keyboards -> Add New Keyboard... 

Addational:

Get host app BundleID, Private func.

Ivar ponyIvar = class_getInstanceVariable ([self.view.window.rootViewController class], "_hostBundleID");
NSString *_hostBundleID = object_getIvar (self.view.window.rootViewController, ponyIvar);
NSLog(@"%@",_hostBundleID);//com.apple.Maps
