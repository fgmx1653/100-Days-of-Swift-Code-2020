# A simple slide-out menu with SwiftUI

So eight days ago I decided to start the #100DaysOfCode challenge. I'm not exactly following [Paul Hudson's](https://twitter.com/twostraws) [100 Days of Swift or SwiftUI](https://www.hackingwithswift.com/100/swiftui/) other than the first 15 days I did want to focus on the [Swift programming language](https://swift.org/documentation/) which has gone okay.

But anyway well doing this challenge I also wanted to be uploading a video every day to kind of show my progress. But yesterday I was running out of time so I did just a swift one take video where I just hit record on my Mac, code for 20 minutes, hit stop recording, and uploaded the video.
I hope the video was somewhat informative but the audio quality was hit and miss for some reason I'll have to look into this. So I thought perhaps this could be a quick little article to write out for anyone that found the audio to be as terrible as I did.

## The code

So open up Xcode and start a new single view project, and rewrite the `body` variable inside your `ContentView`  so it looks like the following.

```swift
ZStack {
    NavigationView {
        List(0 ..< 55) { item in
            Text("Hello, World!")
        }
        .navigationBarTitle("Some App")
        .navigationBarItems(leading: NavButtonView(isOpen: $isOpen))
        
    }
    .offset(x: isOpen ? 300 : 0)
    
    if isOpen {
        Rectangle()
            .edgesIgnoringSafeArea(.vertical)
            .opacity(0.6)
            .onTapGesture {
                self.isOpen.toggle()
        }
        
        HStack {
            List(0 ..< 4) { item in
                Text("Hello, World!")
            }
            .frame(width: 300)
            .padding(.top, 44)
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    } else {
        EmptyView()
    }
}
```

I know that's a lot of code in the `body` but I wrote this out in 20 minutes.

You'll also notice we have an `isOpen` binding to a state property so let's add that above the `body` variable.

```swift
@State private var isOpen = false
```

All right we're almost done we just need to write out the button view for the `.navigationBarItems()` modifier we added to the navigation view.

```swift
struct NavButtonView: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        Button(action: {
            self.isOpen.toggle()
        }, label: {
            Image(systemName: "list.dash")
                .foregroundColor(Color(.label))
        })
    }
}
```

Okay, that'll do it. So that is obviously super basic a lot you could add to it, some polish and clean up but you get a basic slide-out menu in under 62 lines of code.

If you like random SwiftUI videos check out my YouTube channel
[A Swiftly Tilting Planet](https://www.youtube.com/c/ASwiftlyTiltingPlanet).
