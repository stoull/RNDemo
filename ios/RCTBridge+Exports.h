//
//  RCTBridge+Exports.h
//  RNDemo
//
//  Created by hut on 2024/7/10.
//

#ifndef RCTBridge_Exports_h
#define RCTBridge_Exports_h


@interface RCTBridge (PackageBundle)

// exports the private method from RCTBridge
- (RCTBridge *)batchedBridge;
// exports the private method
- (void)executeApplicationScript:(NSData *)script url:(NSURL *)url async:(BOOL)async;
@end

#endif /* RCTBridge_Exports_h */
