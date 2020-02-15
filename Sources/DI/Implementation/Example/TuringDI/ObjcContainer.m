//
//  ObjcContainer.m
//  TuringDI_Example
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

#import "ObjcContainer.h"
#import "TestObjcClass.h"

@import TuringDI;
@import TuringDIInterface;

@interface ObjcContainer()

@property (nonatomic, strong) id<DIProtocolObjc> objcContainer;

@end

@implementation ObjcContainer

- (instancetype)initWithDIContainer:(id<DIProtocolObjc>)diContainer {
    if (self = [super init]) {
        _objcContainer = diContainer;
    }
    return self;

}

- (id)testBlock:(id (^)(void))blockName {
    return blockName();
}


- (void)registerServices {
//    [self.objcContainer registerWithClass:[TestObjcClass class] factory:^(id<DIResolveProtocolObjc> resolver){
//        return [TestObjcClass new];
//    }];
    [self.objcContainer registerWithClass:[TestObjcClass class] emptyFactory:^(){
        return [TestObjcClass new];
    }];
//    [self.objcContainer registerWithProtocol:@protocol(TestObjcClassProtocol) factory:^(id<DIResolveProtocolObjc> resolver){
//        return [TestObjcClass new];
//    }];
}

- (void)resolveServices {
//    id testClass = [self.objcContainer resolveWithClass:[TestObjcClass class]];
//    NSLog(@"objc - resolve class - %@ - %@", testClass != nil ? @"true" : @"false", [testClass numberValue]);

//    id<TestObjcClassProtocol> testProtocol = [self.objcContainer resolveWithProtocol:@protocol(TestObjcClassProtocol)];
//    NSLog(@"objc - resolve class - %@ - %@", testProtocol != nil ? @"true" : @"false", [testProtocol numberValue]);
//    id<TestObjcClassProtocol> testClassProtocol = [self.objcContainer resolveWithProtocol:@protocol(TestObjcClassProtocol)];
//    NSLog(@"objc - resolve protocol - %@", testClassProtocol != nil ? @"true" : @"false");
}

@end
