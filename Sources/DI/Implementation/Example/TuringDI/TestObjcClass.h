//
//  TestObjcClass.h
//  TuringDI_Example
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TestObjcClassProtocol <NSObject>

@property (nonatomic, copy) NSNumber *numberValue;

@end

@interface TestObjcClass : NSObject<TestObjcClassProtocol>

@property (nonatomic, copy) NSNumber *numberValue;

@end

NS_ASSUME_NONNULL_END
