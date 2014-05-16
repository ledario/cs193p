//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Dario Vincent on 11/28/13.
//  Copyright (c) 2013 cs193p. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

- (void)initWithCardType:(Class)cardClass
{
    // Remove existing cards from deck
    [self reset];
    
    if ([[[cardClass alloc] init] isKindOfClass:[PlayingCard class]]) {
        for (NSString *suit in [cardClass validSuits]) {
            for (NSUInteger rank = 1; rank <= [cardClass maxRank]; rank++) {
                PlayingCard *card = [[cardClass alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
}

@end
