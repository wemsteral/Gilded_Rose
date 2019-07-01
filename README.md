# Gilded Rose Refactoring Challenge

See [here](https://github.com/makersacademy/course/blob/master/individual_challenges/gilded_rose.md) for the original Makers repo.  
See [here](https://github.com/emilybache/GildedRose-Refactoring-Kata) for Emily Bache's repo of legacy code.

[The kata](#the-kata) | [The brief](#the-brief) | [Approach](#approach)  
[Getting started](#getting-started) | [Running tests](#running-tests) | [Usage](#usage) |

## The kata

"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."

## The brief

Choose [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata) (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

HINT: Test first FTW!

## Approach

1. I spent time understanding the kata, as if writing from scratch
2. Tidied folder structure to be as per usual Ruby project (and renamed the 'texttest_fixture' to 'texttest_fixture_spec' and placed in spec folder so I could run it every time and observe behaviour)
3. Wrote tests for all current functionality (feature tested for each item's behaviour).
4. Created update methods specific to each item type within the Gilded Rose class, incorporated into long conditional 'update' method.
5. Ran tests every time a change was made. Got to green as simply as possible.
6. Used a linter.
7. Created separate classes for each item type and gave them their own 'update' method.
8. Spotted repetition across item types ('Aged Brie', 'BackStagePass' etc etc) and between those and the 'Item' class, I allowed those sub-classes to inherit from 'Item' and strip out all the behaviour that 'Item' can handle. This meant just leaving an 'update method' in each class which overrides the update method in the parent (exception: Sulfuras, which has no method within it and relies on an empty 'update' method within 'Item'.)
   n.b. I consciously kept 'Sulfuras' as a class (didn't _need_ to) for consistency, readability and extendability.
9. I added unit tests for the new classes.
10. Tested for and added conjured class with appropriate update method.


## Getting started

First clone this repo, then:

```bash
> bundle install
```

## Running tests

```bash
> bundle exec rspec # Run the tests to ensure it works
```

## Usage

```bash
> irb
> require './lib/gilded_rose.rb' # Create items and the Gilded Rose in the command line
```
