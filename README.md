To boost my python flask skills I took a simple code along tutorial from YouTube channel freeCodeCamp.org by a tutor called Aakashns to build a simple dynamic page for job applications.
In the tutorial we handle quick HTML,CSS And Boostrap framework to build a very simple User interface 
Then from the flask app file app.py we added all the necessary routes and functions to render the html files
We build simpl a database to stored jobs and applications submitted data.
To make work easier I went ahead a prepared  a mysql script that configured a user and granted all admin privileges then creates the database with all the necessary tables and data.
Finally we deployed the code on render.com and mysql databases on planet scale hosting site.

What I learnt:
While coding along I encountered this error :  which wasn't encountered in the tutorial since I was using mysql 5.7 I did some research and realised my mysql version couldn't allow me call a dictionary function on a sql object so I had to re write the whole sql code retrieving data from my sql by calling the .isdict() to the dictionary call therefore overcomed the bug.
I also added /api/ route which returns data in json format to serve as my simple api for the project.
To find the original code and tutorial I have linked necessary links below.
