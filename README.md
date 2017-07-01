# GitHub User Search Engine

## Summary

Use Ruby on Rails and Ajax to created a single page application, allows user to search GitHub users by their username.

It will show the user's informations and followers

**How to use**
- enter username and press *Search* button
- will show *Please enter a valid username* when there's no input or can't find match user
- use *Show Follower* buuton to show the user's followers, and also can use *Last Page* and *Next Page* button to switch between pages
- will show *This user doesn't have any followers* when the user has no follower
- the *Next Page* button will hidden when you load the last page of user follower

---

## Technical Choices and Experience

Ruby, Ruby on Rails: 1 year

JavaScript/jQuery/Ajax: 1 year

HTML5: 1 year

CSS3/Bootstrap: 1 year

Heroku: 1 year

---

## Problem and solution

**Need to be a Single Page Application**
- use Ajax to clear and append different partial, so the browser doesn't need to reload the whole page

**The data received from GitHub API is String type (JSON)**
- use Regex to separate data, and for an object's different attribute

**Show User Total Follwers**
- use Rails to get the HTML file of user's profile page
- use Regex to filter out the number of total follwers from that HTML file 

---

## My Profile

[GitHub](https://github.com/yenchieh86)
[CodeWars](www.codewars.com/users/yenchieh86)
[LinkedIn](www.linkedin.com/in/yenchiehchen)

