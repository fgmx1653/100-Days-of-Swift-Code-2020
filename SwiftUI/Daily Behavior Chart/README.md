# Daily Behavior Chart
![Daily Behavior Chart App](https://github.com/calebrwells/100-Days-of-Swift-Code-2020/blob/master/SwiftUI/Daily%20Behavior%20Chart/Assets/000.png)

I'm making a new iOS/iPadOS and macOS app and plan to write about it here.

- Daily Behavior Chart – [App Store coming soon]()
- Daily Behavior Chart – [Code](https://github.com/calebrwells/100-Days-of-Swift-Code-2020/tree/master/SwiftUI/Daily%20Behavior%20Chart/Daily%20Behavior%20Chart)
- Daily Behavior Chart – [Videos coming soon]()

## Day One  – New Xcode Project
---

So here is the sketch of the app idea on my whiteboard.

![Daily Behavior Chart sketch](https://github.com/calebrwells/100-Days-of-Swift-Code-2020/blob/master/SwiftUI/Daily%20Behavior%20Chart/Assets/001.jpg)

The only bit of code I put on the whiteboard was this simple `struct`. The BD is because I am going to use Core Data and I believe it uses binary data to store images and video.

```swift
struct Kid {
    let name: String
    let rewards: String
    let behaviors: String
    let image: String
}
```
So let's launch Xcode, and in the Welcome to Xcode window, click create a new Xcode project, or alternatively, choose File > New > Project.

![Daily Behavior Chart App](https://github.com/calebrwells/100-Days-of-Swift-Code-2020/blob/master/SwiftUI/Daily%20Behavior%20Chart/Assets/002.png)

1. In the window that appears, select the iOS target operating system.
2. Under Application, select the Single View App template, then click Next.

![Daily Behavior Chart App](https://github.com/calebrwells/100-Days-of-Swift-Code-2020/blob/master/SwiftUI/Daily%20Behavior%20Chart/Assets/003.png)
