# Assignment 1 - Todo App

## Problem Statement

Create a mobile app to fetch todos from a restful api and show on screen. Below are the detailed requirements.

Screen:
Todo list screen

Use case:
User can see todo list

Details
1.	Screen has the title ‘Todo List’
2.	Screen shows todo list data fetched from network
3.	While getting data, show activity indicator
4.	In case of network unavailability or error, show error message and reload button
5.	Clicking on reload button, retry fetching data from network

API Specification
- Protocol HTTPS
- Hostname jsonplaceholder.typicode.com
- Method GET
- Endpoint /todos
- Response example: HTTP code 200
  
## Technical Requirements

1. App should use http package for network call
2. App should use 'ListView' to show todo list items
