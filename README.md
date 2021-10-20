# Cart.com Project

Hi there! I hope you enjoy walking through my humble one-pager here.

## Overview

I've set up a very basic Rails app to display the required information -- the longer I spent with the data, the more nuance I found; the more nuance I found, the more the risk of scope creep grew. I settled on rendering the core basics in what I think is a pretty visually appealing style.

After starting the server, navigate to '/events'.

## Functionality

The functionality of the page is primarily written in JS, which I gather is a pretty common use-case in frontend Rails land (my primary Rails experience is in API work). I did set up the files manually rather than using `rails g resource` to show that I understand the basics of setting up the route.

## Style

I used a reset I've pieced together over time, customizing some elements of the card and making a few custom classes, as well as sampling the shade of green used on the Galore site. I was going to use the font, as well, but it wasn't available from Google!

## Testing

I learned some Capybara (as Max mentioned that's the preferred frontend framework), and wrote a very basic test, but I think it gives us a pretty good degree of confidence that things are funcitoning as they should. It's running on Rspec (command `rspec spec/events.rb`).

Under normal circumstances I would seed or mock data to gain tighter control of the final outcome, which would allow for more/more detailed assertions.

## Conculsion

This was fun, I learned some cool new tricks, and I hope to have the chance to learn more as part of the team!