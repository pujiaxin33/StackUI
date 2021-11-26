# StackUI

像`SwiftUI`一样使用`UIStackView`。

借鉴了`SwiftUI`使用的`@propertyWrapper`、`@resultBuilder`、链式语法等特性，让`UIStackView`容易使用。对于`Label`、`Button`、`ImageView`等类，依然是UIKit的使用方式，只是用链式语法进行了封装。

因为`SwiftUI`需要iOS13+的系统才能使用，导致实际项目几乎无法使用`SwiftUI`。但是`SwiftUI`的特性实在太让人着迷了，所以，`StackUI`就是`SwiftUI`在`UIStackView`范围的实现。你可以在`StackUI`去体验`SwiftUI`的部分特性，让你更早去适应新的特性。

如果你厌倦了配置UIKit的约束，那么`StackUI`会是你的好帮手，声明式布局页面的方式让人神清气爽。

# 特性

- [x] 类似`SwiftUI`的声明式语法;
- [x] 数据驱动UI，更新数据UI自动更新；
- [x] 支持`HScrollStack`，`VScrollStack`，当内容超过Stack的宽度或高度时，自动开启滚动；
- [x] 链式语法配置UIKit;
- [x] 可以灵活扩展自定义类支持`StackUI`；

# 要求

- iOS 9.0+
- XCode 13.0+
- Swift 5.4+

# 安装


## CocoaPods

```ruby
target '<Your Target Name>' do
    pod 'StackUI'
    //如果要使用RxSwift
    pod 'StackUI/RxSwift'
end
```
先执行`pod repo update`，再执行`pod install`

## SPM

- File > Swift Packages > Add Package Dependency
- Add https://github.com/pujiaxin33/StackUI.git
- Select "Up to Next Major" with "0.0.5"
- 如果你想使用`RxSwift`特性，选择`StackUISwithRxSwift` Product

# 使用示例

## `HStack`使用
```Swift
    HStack(alignment: .center, spacing: 5) {
        ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
        Label("用户昵称").font(.systemFont(ofSize: 18, weight: .medium))
    }
```

## `VStack`使用
```Swift
    VStack {
        Label("用户昵称").font(.systemFont(ofSize: 18, weight: .medium))
        Label().text("用户很懒，什么都没有留下来！").font(.systemFont(ofSize: 12)).textColor(.gray)
    }
```

## `HScrollStack`和`ForIn`使用

```Swift
    var users = [UserModel]()
    for index in 0...25 {
        let model = UserModel(avatar: "avatar", name: "用户\(index)", desc: "用户描述\(index)")
        users.append(model)
    }
    HScrollStack() {
        for model in users {
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

## `@Live`使用

在属性前面添加`@Live`，在使用的时候添加`$`符号前缀。更新属性的时候，关联的UIKit会自动更新界面。
```Swift
    //定义
    @Live var nickName: String? = "用户昵称"
    @Live var desc: String? = "用户很懒，什么都没有留下来！"
    
    //使用
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
    
    //更新
    nickName = "周杰伦"
    desc = "哎哟，不错哟❤️"
```

## `RxSwift`的`Driver`使用

```Swift
    //定义
    var nickName = PublishSubject<String?>()
    var desc = PublishSubject<String?>()
    
    //使用
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
    
    //更新
    nickName.onNext("周杰伦")
    desc.onNext("哎哟，不错哟❤️")
```

## If语句
```Swift
    var isShowInfo: Bool = false
    
    HStack(distribution: .equalCentering, alignment: .center) {
        HStack(alignment: .center, spacing: 5) {
            ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
            if self.isShowInfo == true {
                VStack {
                    Label("用户昵称").font(.systemFont(ofSize: 18, weight: .medium))
                    Label().text("用户很懒，什么都没有留下来！").font(.systemFont(ofSize: 12)).textColor(.gray)
                }
            }else {
                Label("没有信息")
            }
        }
        ImageView().image(UIImage(named: "arrow_right"))
    }
```

## 自定义View支持`StackUI`

### 可以自定义父类
继承自`View`、`Label`等，再扩展自定义的属性。
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

### 父类无法修改，遵从协议
遵从`StackUIView`、`StackUILabel`等协议，再扩展自定义的属性。
```Swift
class CustomView: UIView, StackUIView {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.backgroundColor = customColor
        return self
    }
}
class CustomLabel: UILabel, StackUILabel {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.textColor = customColor
        return self
    }
}
```

## 链式语法暂未支持的属性配置

通过apply闭包统一配置
```
HStack(alignment: .center, spacing: 5) {
    Label().text(model.desc).apply { label in
        //如果有链式语法没有定义的属性，可以在apply闭包里面统一配置，也可以提交Issue进行支持。
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
    }
}
```

## `ViewBox`使用
有时候控件需要额外的间距，这个时候可以把该控件放入ViewBox，然后设置paddings设置内边距，就可以间接实现控件上下左右边距的设置。
如下代码所示：Label就有了`top: 10, left: 20, bottom: 10, right: 20`的边距了。
```Swift
ViewBox(paddings: .init(top: 10, left: 20, bottom: 10, right: 20)) {
    Label("爱好：写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；").font(.systemFont(ofSize: 15)).numberOfLines(0)
}.backgroundColor(.lightGray)
```

# 目前支持的类
- `Layer`的相关属性配置在`View`类
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

如果有其他需要支持的类和属性，欢迎提交Issue或Pull Request。


# Contribution

有任何疑问或建议，欢迎提Issue和Pull Request进行交流🤝



