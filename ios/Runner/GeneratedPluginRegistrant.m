//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<camera_avfoundation/CameraPlugin.h>)
#import <camera_avfoundation/CameraPlugin.h>
#else
@import camera_avfoundation;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

#if __has_include(<photo_manager/PhotoManagerPlugin.h>)
#import <photo_manager/PhotoManagerPlugin.h>
#else
@import photo_manager;
#endif

#if __has_include(<sqflite_darwin/SqflitePlugin.h>)
#import <sqflite_darwin/SqflitePlugin.h>
#else
@import sqflite_darwin;
#endif

#if __has_include(<video_player_avfoundation/FVPVideoPlayerPlugin.h>)
#import <video_player_avfoundation/FVPVideoPlayerPlugin.h>
#else
@import video_player_avfoundation;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [CameraPlugin registerWithRegistrar:[registry registrarForPlugin:@"CameraPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
  [PhotoManagerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PhotoManagerPlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
  [FVPVideoPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FVPVideoPlayerPlugin"]];
}

@end
