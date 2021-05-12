//
//  AddDelegation.h
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AddDelegation <NSObject>

-(void) addTask : (NSMutableDictionary*) dataDictionary;
@end

NS_ASSUME_NONNULL_END
