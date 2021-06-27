# Gilded rose tech test

## Quickstart

```bash
> git clone https://github.com/KaneG9/gilded_rose.git
> cd gilded_rose
> bundle install
> rspec #run tests
> irb -r './lib/gilded_rose.rb' #run program in irb
```
## Approach
* I began this test by writing out passing tests for the legacy code as it was functioning in the desired way for the client. This meant I would be able to make sure my code continued to function in this way as I refactored it.
* Following this I updated the `update_quality` to a case...when syntax to improve readability of the code.
* A guard clause was created for Sulfuras as this items properties were never updated.
* I then created a new class `ItemManager` in order to manage the properties of the items and extracted the update logic to this class. This meant my `update_quality` method was now only responsible for deciding what type of item was being updated.
* `ItemManager` contains specific update methods for each type of item and these are called in `update_quality`
* I then added unit tests for the `ItemManager` and converted my initial tests to feature tests as these tests now covered multiple classes.
* I then created `update_conjured` in the `ItemManager` via TDD before adding in a case for Conjured items in `update_quality`.
* I considered splitting up ItemManager into an expired and in date class, however Im not sure that would help improve the readability of the code.

## Improvements
* Upon receiving feedback there are a few improvements I would try to implement if I were to retry this kata.
* I would try to make item definitions for backstage passes and conjured items look for the strings 'backstage pass' and 'conjured' within the item name rather than a specific string. This would allow the program to be more flexible with different item names for these item types as there could be several names for items contained within each type.
* Additionally I would create subclasses of the `Item` class with an `update_quality` method specific to each item type. This would improve the reability of the code and help extract logic into separate components which would help improve the maintainability of the program.
* In order to implement the subclass structure I would need to create an item factory which would convert the original items into their respective subclasses based upon their names.

## Specification

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.
