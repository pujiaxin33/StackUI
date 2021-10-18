# StackUI

[中文文档](https://github.com/pujiaxin33/StackUI/blob/main/README-CN.md)

Use `UIStackView` like `SwiftUI`.

Use `@propertyWrapper`, `@resultBuilder`, chain syntax and other features used by `SwiftUI`, making `UIStackView` easy to use. For classes such as `Label`, `Button`, and `ImageView`, it is still the way to use UIKit, but it is encapsulated with chain syntax.

Because `SwiftUI` requires an iOS13+ system to be used, it is almost impossible to use `SwiftUI` in actual projects. But the features of `SwiftUI` are really fascinating, so `StackUI` is the implementation of `SwiftUI` in the scope of `UIStackView`. You can experience some of the features of `SwiftUI` in `StackUI`, so that you can learn the new features earlier.

If you are tired of configuring the constraints of UIKit, then `StackUI` will be a good helper for you. The declarative layout make world better.

# Features

- [x] Declarative syntax similar to `SwiftUI`;
- [x] Data-driven UI, update data then UI automatically updates;
- [x] Support `HScrollStack`, `VScrollStack`, when the content exceeds the width or height of the stack, scrolling is automatically turned on;
- [x] Chained syntax configuration UIKit;
- [x] Can flexibly extend custom classes to support `StackUI`;

# Require

- iOS 9.0+
- XCode 13.0+
- Swift 5.0+

# Install


## CocoaPods

```ruby
target'<Your Target Name>' do
    pod'StackUI'
    //If you want to use RxSwift
    pod'StackUI/RxSwift'
end
```
Execute `pod repo update` first, then execute `pod install`

## SPM

- File> Swift Packages> Add Package Dependency
- Add https://github.com/pujiaxin33/StackUI.git
- Select "Up to Next Major" with "0.0.2"
- If you want to use `RxSwift` feature, select `StackUISwithRxSwift` Product

# Example 

## `HStack` 
```Swift
    HStack(alignment: .center, spacing: 5) {
        ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
        Label("user nickname").font(.systemFont(ofSize: 18, weight: .medium))
    }
```

## `VStack` 
```Swift
    VStack {
        Label("user nickname").font(.systemFont(ofSize: 18, weight: .medium))
        Label().text("The user is lazy, nothing left!").font(.systemFont(ofSize: 12)).textColor(.gray)
    }
```

## `HScrollStack` and `ForEach`

```Swift
    var users = [UserModel]()
    for index in 0...25 {
        let model = UserModel(avatar: "avatar", name: "user\(index)", desc: "user description\(index)")
        users.append(model)
    }
    HScrollStack() {
        ForEach(users) {(model) in
            HStack(alignment: .center, spacing: 5) {
                Spacer(spacing: 12)
                ImageView().image(UIImage(named: model.avatar)).size(width: 80, height: 80)
                VStack {
                    Label(model.name).font(.systemFont(ofSize: 18, weight: .medium))
                    Label().text(model.desc).font(.systemFont(ofSize: 12)).textColor(.gray)
                }
                Divider()
            }.size(width: 300)
        }
    }
```

## `@Live` 

Add `@Live` in front of the property, and add the `$` symbol prefix when using it. When updating properties, the associated UIKit will automatically update the interface.
```Swift
    //definition
    @Live var nickName: String? = "User nickname"
    @Live var desc: String? = "The user is lazy, and nothing is left!"
    
    //use
    HStack(distribution: .equalCentering, alignment: .center) {
        HStack(alignment: .center, spacing: 5) {
            ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
            VStack {
                Label($nickName).font(.systemFont(ofSize: 18, weight: .medium))
                Label().text($desc).font(.systemFont(ofSize: 12)).textColor(.gray)
            }
        }
        ImageView().image(UIImage(named: "arrow_right"))
    }
    
    //update
    nickName = "Jay Chou"
    desc = "Ouch, not bad ❤️"
```

## `Driver` of `RxSwift`

```Swift
    //definition
    var nickName = PublishSubject<String?>()
    var desc = PublishSubject<String?>()
    
    //use
    HStack(distribution: .equalCentering, alignment: .center) {
        HStack(alignment: .center, spacing: 5) {
            ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
            VStack {
                Label(nickName.asDriver(onErrorJustReturn: nil)).font(.systemFont(ofSize: 18, weight: .medium))
                Label().text(desc.asDriver(onErrorJustReturn: nil)).font(.systemFont(ofSize: 12)).textColor(.gray)
            }
        }
        ImageView().image(UIImage(named: "arrow_right"))
    }
    
    //update
    nickName.onNext("Jay Chou")
    desc.onNext("Ouch, not bad ❤️")
```

## Custom View supports `StackUI`

### You can customize the parent class
Inherit from `View`, `Label`, etc., and then extend custom attributes.
```Swift
class CustomView: View {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.backgroundColor = customColor
        return self
    }
}
class CustomLabel: Label {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.textColor = customColor
        return self
    }
}
```

### The parent class cannot be modified, conform the protocol
Conform protocols such as `StackUIView` and `StackUILabel`, and then extend custom attributes.
```Swift
class CustomViewFromProtocol: UIView, StackUIView {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.backgroundColor = customColor
        return self
    }
}
class CustomLabelFromProtocol: UILabel, StackUILabel {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.textColor = customColor
        return self
    }
}
```


# Currently supported classes
- `Layer`:The relevant properties of `Layer` are configured in the `View` class
- `View`
- `ImageView`
- `Control`
- `Label`
- `Button`
- `TextField`
- `TextView`
- `Stepper`
- `SwitchUI`
- `PageControl`
- `Slider`
- `Spacer`
- `Divider`
- `ActivityIndicatorView`
- `ScrollView`
- `TableView`
- `CollectionView`

If there are other classes and attributes that need to be supported, please submit an Issue or Pull Request.

