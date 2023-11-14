playstore=# SELECT app_name FROM analytics
playstore-# WHERE id = 1880;
-[ RECORD 1 ]---------------------
app_name | Web Browser for Android
--displaying the app with ID 1880--

playstore=# SELECT id, app_name FROM analytics
WHERE last_updated = '2018-08-01';
-[ RECORD 1 ]-------------------------------------------------------------------------------
id       | 10
app_name | Clash Royale
-[ RECORD 2 ]-------------------------------------------------------------------------------
id       | 11
app_name | Candy Crush Saga
-[ RECORD 3 ]-------------------------------------------------------------------------------
id       | 12
app_name | UC Browser - Fast Download Private & Secure
-[ RECORD 4 ]-------------------------------------------------------------------------------
id       | 74
app_name | Score! Hero
-[ RECORD 5 ]-------------------------------------------------------------------------------
id       | 101
app_name | Tiny Flashlight + LED
-[ RECORD 6 ]-------------------------------------------------------------------------------
id       | 102
app_name | Crossy Road
-[ RECORD 7 ]-------------------------------------------------------------------------------
--displaying apps that were last update on 08-01-2018--

playstore=# SELECT category, COUNT(*)
playstore-# FROM analytics
playstore-# GROUP BY category;
-[ RECORD 1 ]-----------------
category | BOOKS_AND_REFERENCE
count    | 191
-[ RECORD 2 ]-----------------
category | COMMUNICATION
count    | 342
-[ RECORD 3 ]-----------------
category | BEAUTY
count    | 46
-[ RECORD 4 ]-----------------
category | EVENTS
count    | 52
-[ RECORD 5 ]-----------------
category | PARENTING
count    | 59
-[ RECORD 6 ]-----------------
category | PHOTOGRAPHY
count    | 313
-[ RECORD 7 ]-----------------
category | GAME
count    | 1110
-[ RECORD 8 ]-----------------
category | BUSINESS
count    | 313
-[ RECORD 9 ]-----------------
category | SOCIAL
count    | 269
-[ RECORD 10 ]----------------
category | MEDICAL
count    | 350
-[ RECORD 11 ]----------------
category | TOOLS
count    | 753
-[ RECORD 12 ]----------------
category | TRAVEL_AND_LOCAL
count    | 234
-[ RECORD 13 ]----------------
category | ART_AND_DESIGN
count    | 63
-[ RECORD 14 ]----------------
category | LIFESTYLE
count    | 319
-[ RECORD 15 ]----------------
category | WEATHER
count    | 79
-[ RECORD 16 ]----------------
category | COMICS
count    | 59
-[ RECORD 17 ]----------------
category | PRODUCTIVITY
--counting number of apps in each category--

category | PRODUCTIVITY
playstore=# SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;
-[ RECORD 1 ]--------------------------------------
app_name | Facebook
reviews  | 78158306
-[ RECORD 2 ]--------------------------------------
app_name | WhatsApp Messenger
reviews  | 78128208
-[ RECORD 3 ]--------------------------------------
app_name | Instagram
reviews  | 69119316
-[ RECORD 4 ]--------------------------------------
app_name | Messenger – Text and Video Chat for Free
reviews  | 69119316
-[ RECORD 5 ]--------------------------------------
app_name | Clash of Clans
reviews  | 69109672
--displaying the top 5 most-reviewed apps and the number of reviews for each--

playstore=# SELECT app_name, reviews FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
-[ RECORD 1 ]--------
app_name | Chess Free
reviews  | 4559407
--displaying app with the most reviews and a rating greater than or equal to 4.8--

playstore=# SELECT category, AVG(rating) AS average_rating
FROM analytics 
GROUP BY category
ORDER BY average_rating DESC;
-[ RECORD 1 ]--+--------------------
category       | EVENTS
average_rating | 4.395238104320708
-[ RECORD 2 ]--+--------------------
category       | EDUCATION
average_rating | 4.38903223006956
-[ RECORD 3 ]--+--------------------
category       | ART_AND_DESIGN
average_rating | 4.347540949211746
-[ RECORD 4 ]--+--------------------
category       | BOOKS_AND_REFERENCE
average_rating | 4.3423728633061645
-[ RECORD 5 ]--+--------------------
category       | PERSONALIZATION
average_rating | 4.3283387457509
-[ RECORD 6 ]--+--------------------
category       | BEAUTY
average_rating | 4.299999970656175
-[ RECORD 7 ]--+--------------------
category       | GAME
average_rating | 4.287167731498383
-[ RECORD 8 ]--+--------------------
category       | PARENTING
average_rating | 4.285714266251545
-[ RECORD 9 ]--+--------------------
category       | HEALTH_AND_FITNESS
average_rating | 4.2743944663902464
-[ RECORD 10 ]-+--------------------
category       | SHOPPING
average_rating | 4.253648051376507
-[ RECORD 11 ]-+--------------------
category       | SOCIAL
average_rating | 4.245669291244717
-[ RECORD 12 ]-+--------------------
category       | WEATHER
average_rating | 4.24399998664856
-[ RECORD 13 ]-+--------------------
category       | SPORTS
average_rating | 4.233333332576449
-[ RECORD 14 ]-+--------------------
category       | PRODUCTIVITY
average_rating | 4.212173904543338
-[ RECORD 15 ]-+--------------------
category       | AUTO_AND_VEHICLES
average_rating | 4.200000017881393
-[ RECORD 16 ]-+--------------------
category       | HOUSE_AND_HOME
average_rating | 4.197368430463891
-[ RECORD 17 ]-+--------------------
category  
--displaying average rating for each cateogry ordered by the highest to lowest--

playstore=# SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;
-[ RECORD 1 ]----------------
app_name | Naruto & Boruto FR
price    | 379.99
rating   | 2.9
--displaying the name, price, and rating of the most expensive app with a rating that is less than 3--

playstore=# SELECT * FROM analytics  WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;
-[ RECORD 1 ]---+-----------------------------------------------
id              | 9468
app_name        | DT
category        | FAMILY
rating          | 5
reviews         | 4
size            | 52M
min_installs    | 50
price           | 0
content_rating  | Everyone
genres          | {Education}
last_updated    | 2018-04-03
current_version | 1.1
android_version | 4.1 and up
-[ RECORD 2 ]---+-----------------------------------------------
id              | 9464
app_name        | DQ Akses
category        | PERSONALIZATION
rating          | 5
reviews         | 4
size            | 31M
min_installs    | 50
price           | 0.99
content_rating  | Everyone
genres          | {Personalization}
last_updated    | 2018-04-27
current_version | 1.1
android_version | 4.1 and up
-[ RECORD 3 ]---+-----------------------------------------------
id              | 9453
app_name        | DM Adventure
category        | MEDICAL
rating          | 5
reviews         | 4
size            | 25M
min_installs    | 1
price           | 0
content_rating  | Everyone
genres          | {Medical}
last_updated    | 2018-08-02
current_version | 1.0.72
android_version | 4.0.3 and up
-[ RECORD 4 ]---+-----------------------------------------------
id              | 9427
app_name        | db Meter - sound level meter with data logging
category        | GAME
rating          | 5
reviews         | 5
size            | 4.6M
min_installs    | 10
--displaying apps with a min install not exceeding 50 and is ordered by highest first--
playstore=# SELECT app_name FROM analytics 
playstore-# WHERE rating < 3 AND reviews <= 1000;
-[ RECORD 1 ]----------------------------------------------------
app_name | Eshopcy.com.cy
-[ RECORD 2 ]----------------------------------------------------
app_name | Blood Pressure Companion
-[ RECORD 3 ]----------------------------------------------------
app_name | DL Calculator
-[ RECORD 4 ]----------------------------------------------------
app_name | ADMIRALTY H-Note
-[ RECORD 5 ]----------------------------------------------------
app_name | cm, mm to inch, feet converter tool
-[ RECORD 6 ]----------------------------------------------------
app_name | Arabic Chat - Chat
-[ RECORD 7 ]----------------------------------------------------
app_name | Baba Yaad Hai?(BK’s)
-[ RECORD 8 ]----------------------------------------------------
app_name | Soo Co-op Mobile Banking
-[ RECORD 9 ]----------------------------------------------------
app_name | Free Live Talk-Video Call
-[ RECORD 10 ]---------------------------------------------------
app_name | Car Crash III Beam DH Real Damage Simulator 2018
-[ RECORD 11 ]---------------------------------------------------
app_name | N Launcher: Nougat Theme
-[ RECORD 12 ]---------------------------------------------------
app_name | Theme for Iphone X Plus
-[ RECORD 13 ]---------------------------------------------------
app_name | Make a burger king
-[ RECORD 14 ]---------------------------------------------------
app_name | mobileRx Pharmacy
-[ RECORD 15 ]---------------------------------------------------
app_name | CG Creative Sets: 2D/3D Artist
-[ RECORD 16 ]---------------------------------------------------
app_name | Officiel du SCRABBLE LAROUSSE
-[ RECORD 17 ]---------------------------------------------------
app_name | Tap The Easter Egg!
-[ RECORD 18 ]---------------------------------------------------
app_name | AP Biology Study Guide + Quiz
-[ RECORD 19 ]---------------------------------------------------
app_name | DW Spectrum™ IP VMS
-[ RECORD 20 ]---------------------------------------------------
app_name | The Florida Trail Guide
-[ RECORD 21 ]---------------------------------------------------
app_name | AG Contacts, Premium edition
-[ RECORD 22 ]---------------------------------------------------
app_name | AP Flashcards
-[ RECORD 23 ]---------------------------------------------------
app_name | FREE VIDEO CHAT - LIVE VIDEO AND TEXT CHAT
-[ RECORD 24 ]---------------------------------------------------
app_name | MelifeCam-M
-[ RECORD 25 ]---------------------------------------------------
app_name | Rock n Roll Music Quiz Game
-- displaying app names with a rating of 3 or less and at least 1000 reviews--
playstore=# SELECT * FROM analytics
WHERE price BETWEEN 0.1 AND 1
ORDER BY reviews DESC LIMIT 10;
-[ RECORD 1 ]---+--------------------------------------------
id              | 1144
app_name        | Free Slideshow Maker & Video Editor
category        | GAME
rating          | 4.6
reviews         | 408292
size            | 29M
min_installs    | 10000000
price           | 0.99
content_rating  | Mature 17+
genres          | {Action}
last_updated    | 2018-07-12
current_version | 1.7.110758
android_version | 4.1 and up
-[ RECORD 2 ]---+--------------------------------------------
id              | 2298
app_name        | Couple - Relationship App
category        | GAME
rating          | 4.3
reviews         | 85468
size            | 36M
min_installs    | 1000000
price           | 0.99
content_rating  | Everyone
genres          | {Arcade}
last_updated    | 2018-06-08
current_version | 2.4.1.485300
android_version | 4.0.3 and up
-[ RECORD 3 ]---+--------------------------------------------
id              | 2315
app_name        | Anime X Wallpaper
category        | FAMILY
rating          | 4.6
reviews         | 84114
size            | 23M
min_installs    | 500000
price           | 0.99
content_rating  | Everyone 10+
genres          | {Puzzle}
last_updated    | 2018-07-05
current_version | 1.13.108869
android_version | 2.3.3 and up
-[ RECORD 4 ]---+--------------------------------------------
id              | 2603
app_name        | Dance On Mobile
category        | FAMILY
rating          | 4.6
reviews         | 61264
size            | 43M
min_installs    | 1000000
--display the top 10 most reviewed apps that cost between .1 cents and 1 dollar--
playstore=# SELECT * FROM analytics
playstore-# ORDER BY last_updated LIMIT 1;
-[ RECORD 1 ]---+----------------
id              | 5701
app_name        | CP Clicker
category        | FAMILY
rating          | 4.2
reviews         | 1415
size            | 209k
min_installs    | 100000
price           | 0
content_rating  | Everyone
genres          | {Entertainment}
last_updated    | 2010-05-21
current_version | 3.1
android_version | 1.5 and up

--find the most out of date app--

playstore=# SELECT SUM(reviews) AS "All the Reviews" FROM analytics;
-[ RECORD 1 ]---+-----------
All the Reviews | 4814575866
--count all the reviews in the google play store--

playstore=# SELECT category FROM analytics GROUP BY category
HAVING COUNT(*) > 300;
-[ RECORD 1 ]-------------
category | COMMUNICATION
-[ RECORD 2 ]-------------
category | PHOTOGRAPHY
-[ RECORD 3 ]-------------
category | GAME
-[ RECORD 4 ]-------------
category | BUSINESS
-[ RECORD 5 ]-------------
category | MEDICAL
-[ RECORD 6 ]-------------
category | TOOLS
-[ RECORD 7 ]-------------
category | LIFESTYLE
-[ RECORD 8 ]-------------
category | PRODUCTIVITY
-[ RECORD 9 ]-------------
category | PERSONALIZATION
-[ RECORD 10 ]------------
category | FINANCE
-[ RECORD 11 ]------------
category | SPORTS
-[ RECORD 12 ]------------
category | FAMILY
--find all categories that have more than 300 apps in them--

playstore=# SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion
  FROM analytics
  WHERE min_installs >= 100000
  ORDER BY proportion DESC
  LIMIT 1;
-[ RECORD 1 ]+-----------------
app_name     | Kim Bu Youtuber?
reviews      | 66
min_installs | 10000000
proportion   | 151515

--find the app that has the highest proportion of reviews min installsamong apps that have been 
--installed at least 100,000 times. 
--Display the name of the app along with the number of reviews, the min_installs, and the proportion.--
