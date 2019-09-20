# Facebook Page Likes Quicktrack

 A Swift Playground that tracks the likes of a Facebook Page with HTML.

## How it works?

* The playground downloads the HTML Facebook Page, with the specified interval, and then parse the HTML file to get the like counts.

* The playground was designed to parse the page in the zh-tw form; however, both https://zh-tw.facebook.com/`PAGE` and https://www.facebook.com/`PAGE` will be automatically changed to the acceptable form.

* The playground will run continuously, logging the information with the specified interval. The logging will be in the format of `Current Date - Timestamp - Current Total Likes - (Changes compare to the first log)`

* Notice that when the interval is too short, Facebook will detect that something fishy is happening. Setting an interval that is long enough but not too long to see the changes is key.

## How to run it?

To run this Swift playground, you would need a macOS running device with a version of Xcode that supports Swift 5.

## Example

This bot was originally designed to track the decrease of likes of the Taipei Mayor Ko to see how fast the likes are dropping. However, it accidentally capture the dramatic like boost happening around 19:30 on Sep 19, 2019. Here are some of the screenshots.

![](https://i.imgur.com/zVAfSQk.png)

<small>Likes were steadly decreasing before the checkpoint on 19:34.</small>

![](https://i.imgur.com/lltljmU.png)

<small>Likes change since 17:54 on Sep 18 reached 10,000.</small>

## License

This playground is licensed under the MIT License. You can modify it to fit your needs.
