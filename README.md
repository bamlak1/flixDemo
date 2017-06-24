# Project 2 - *FlixDemo*

**Flix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **14** hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User can view a list of movies currently playing in theaters from The Movie Database.
- [X] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [X] User sees a loading state while waiting for the movies API.
- [X] User can pull to refresh the movie list.

The following **optional** features are implemented:

- [ ] User sees an error message when there's a networking error.
- [X] Movies are displayed using a CollectionView instead of a TableView.
- [X] User can search for a movie.
- [ ] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the selection effect of the cell.
- [ ] Customize the navigation bar.
- [X] Customize the UI.

The following **additional** features are implemented:

- [X] Tab bar has both option for table view and collection view

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to implement infinite scrolling, theres a limited amount of data so how could the api pull more than it has?
2. Is it worth the time to customize the nav bar and other features that the UI automatically creates? Changing some features of that seems arduous and unnecessary.


## Video Walkthrough

Here's a walkthrough of implemented user stories:

Basic:
![](https://github.com/bamlak1/flixDemo/blob/master/flixDemoBasic.gif)

Advanced:
![](https://github.com/bamlak1/flixDemo/blob/master/flixDemoAdvanced.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

My greatest challenge was probably working with the connections between the view controllers and the classes when changing things programmatically.
Another challenge I faced was creating the collection view and integrating the same detailed view as I used for the movieViewController for the new viewController. 
It was also difficult to add the search bar and to work with the tab bar, creating two different naviation controllers for the same view controller (that for the tab bar and that for the nav bar).

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.
I used the icons and graphics provided by the modules for the app icon and the launch screen.
- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
