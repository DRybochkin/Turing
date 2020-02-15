//
//  ObjcContainer.h
//  TuringDI_Example
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObjcClass.h"
@import TuringDIInterface;

NS_ASSUME_NONNULL_BEGIN

@interface ObjcContainer : NSObject

- (instancetype)initWithDIContainer:(id<DIProtocolObjc>)diContainer;

- (void)registerServices;
- (void)resolveServices;

- (id)testBlock:(id (^)(void))blockName;

@end

NS_ASSUME_NONNULL_END
