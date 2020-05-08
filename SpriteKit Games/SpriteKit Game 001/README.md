# SpriteKit Game 001

Let's make a game!

After we delete all the files mentioned in the [video]() we can go to the AppDelegate and add this to the `didFinishLaunchingWithOptions`.

```swift
window = UIWindow()
window?.makeKeyAndVisible()
window?.rootViewController = GameViewController()
```
We will need that code as we have deleted the Main.storyboard.
