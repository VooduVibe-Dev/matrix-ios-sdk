/*
 Copyright 2019 New Vector Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXEventContentRelatesTo.h"


@implementation MXEventContentRelatesTo

#pragma mark - MXJSONModel

+ (id)modelFromJSON:(NSDictionary *)JSONDictionary
{
    MXEventContentRelatesTo *relatesTo;

    NSString *relationType;
    NSString *eventId;
    MXJSONModelSetString(relationType, JSONDictionary[@"rel_type"]);
    MXJSONModelSetString(eventId, JSONDictionary[@"event_id"]);

    if (relationType && eventId)
    {
        relatesTo = [MXEventContentRelatesTo new];
        relatesTo->_relationType = relationType;
        relatesTo->_eventId = eventId;

        MXJSONModelSetString(relatesTo->_key, JSONDictionary[@"key"]);
    }

    return relatesTo;
}

- (BOOL)isEqual:(id)object
{
    if (self == object)
    {
        return YES;
    }
    
    if (![object isKindOfClass:[MXEventContentRelatesTo class]])
    {
        return NO;
    }
    
    return [self isEqualToEventContentRelatesTo:(MXEventContentRelatesTo *)object];
}

- (BOOL)isEqualToEventContentRelatesTo:(MXEventContentRelatesTo*)eventContentRelatesTo
{
    return [_relationType isEqualToString:eventContentRelatesTo.relationType]
    && [_eventId isEqualToString:eventContentRelatesTo.eventId]
    && [_key isEqualToString:eventContentRelatesTo.key]
    ;
}

- (NSUInteger)hash
{
    return [self.relationType hash] ^ [self.eventId hash] ^ [self.key hash];
}

@end