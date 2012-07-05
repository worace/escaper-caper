escaper-caper
=============

http://escapercaper.com

Selling travel is about stimulating the imagination. People want to
sample the local color and to feel like they are getting a special
experience.

In a perfect world, every escape would get the full-spread _Travel &
Leisure_ treatment. Since we don't live in that world, _Escaper Caper_
is here to give some extra context to LivingSocial escapes.

In a nutshell, the app pulls images from flickr and checks foursquare
for venues near each escape. Based on the types of venues that are
found, it groups the escapes into categories like _food_, _nightlife_,
or _arts & entertainment_. Pick a category, and escaper caper will show
you an escape that matches it. When viewing an escape, you'll see a
collection of photos and foursquare venues aimed at giving a rough "on
the ground" look at what the place might feel like. 

### To run tests:

`git clone git://github.com/worace/escaper-caper.git`

database.yml is not committed for the sake of server config, so we need to rename it for tests:

`mv config/database.test.yml config/database.yml`

`bundle install`

Make sure you have redis running on default port:

`redis-server /usr/local/etc/redis.conf`

Run the tests:

`bundle exec rspec`

One note - the tests use VCR to cache the API responses from foursquare
and flickr when testing the background jobs, so you will need to be
connected to the internet on the initial run.
