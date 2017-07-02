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

- Ruby, Ruby on Rails: 1 year

- JavaScript/jQuery/Ajax: 1 year

- HTML5: 1 year

- CSS3/Bootstrap: 1 year

- Heroku: 1 year

---

## Problem and solution

**Need to be a Single Page Application**
- use Ajax to clear and append different partial, so the browser doesn't need to reload the whole page

**The data received from GitHub API is String type (JSON)**
- use JSON.parse to change String back to Array or Hash

**Show User Total Follwers**
- use Rails to get the HTML file of user's profile page
- use Regex to filter out the number of total follwers from that HTML file 

**Some method need to access to GitHub API**
- use stub on the controller test
- add two methods in application controller (*get_element*, *get_follower_list*),
  so I can use stub to let them return different data

---

## Scalability

**DataBase**
- I keep the Active Record for this project, so it can have model and database.
- If don't need model and database, then should use *--skip-active-record* instead, than the size of App can be smaller.

---

## My Profile

- [GitHub](https://github.com/yenchieh86)
- [CodeWars](https://www.codewars.com/users/yenchieh86)
- [LinkedIn](https://www.linkedin.com/in/yenchiehchen)

---

## Application

[Heroku](https://yen-shipt-coding-test.herokuapp.com/)

![Show-Img](https://raw.githubusercontent.com/yenchieh86/GitHub_User_Search_App/master/app/assets/images/show_img.jpg)