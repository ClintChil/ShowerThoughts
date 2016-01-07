# ShowerThoughts

Some of your best ideas strike you while showering. ShowerThoughts for watchOS allows you to dictate your thoughts and post them to Reddit via your waterproof Apple Watch.

![User Story Illustration](https://c2.staticflickr.com/2/1579/24153558111_1788cb4fa8.jpg)

Inspired by [/r/ShowerThougts](https://www.reddit.com/r/Showerthoughts/) and [The MacGyver Method](https://youtu.be/gaDInuYw98k).

This app was presented at the [2015 Apple Watch Hackathon](http://www.youtube.com/watch?v=xA97JPHC2D4&t=0m35s) and written by Clint Chilcott & Rich Fellure for WatchOS 1. 

# This App is Broken ☹️
As of August 2015 Reddit requires Oauth to use it's API. The framework we used for this project, [RedditKit](https://github.com/samsymons/RedditKit), did not meet that deadline and still has no support for Oauth 2.0. In addition, since this app is written for WatchOS 1 it will not work on WatchOS 2.

# What is next for ShowerThougts
This app needs to be rewritten from the ground up for WatchOS 2 and I'd like to see the concept decoupled from Reddit. 
