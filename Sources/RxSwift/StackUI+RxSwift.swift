//
//  StackUI+RxSwift.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/13.
//

import UIKit
import RxSwift
import RxCocoa
#if !COCOAPODS
import StackUI
#endif

//The code below from NSObject+Rx
fileprivate var disposeBagContext: UInt8 = 0

/// each HasDisposeBag offers a unique RxSwift DisposeBag instance
protocol HasDisposeBag: AnyObject {

    /// a unique RxSwift DisposeBag instance
    var disposeBag: DisposeBag { get set }
}

extension HasDisposeBag {

    func synchronizedBag<T>( _ action: () -> T) -> T {
        objc_sync_enter(self)
        let result = action()
        objc_sync_exit(self)
        return result
    }

    var disposeBag: DisposeBag {
        get {
            return synchronizedBag {
                if let disposeObject = objc_getAssociatedObject(self, &disposeBagContext) as? DisposeBag {
                    return disposeObject
                }
                let disposeObject = DisposeBag()
                objc_setAssociatedObject(self, &disposeBagContext, disposeObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return disposeObject
            }
        }

        set {
            synchronizedBag {
                objc_setAssociatedObject(self, &disposeBagContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
//The code above from NSObject+Rx
extension Label: HasDisposeBag {}
public extension Label {
    convenience init(_ driver: Driver<String?>) {
        self.init()
        driver.drive { [weak self] text in
            self?.text = text
        }.disposed(by: disposeBag)
    }
    convenience init(_ driver: Driver<String>) {
        self.init()
        driver.drive { [weak self] text in
            self?.text = text
        }.disposed(by: disposeBag)
    }
    func text(_ driver: Driver<String?>) -> Self {
        driver.drive { [weak self] text in
            self?.text = text
        }.disposed(by: disposeBag)
        return self
    }
    func text(_ driver: Driver<String>) -> Self {
        driver.drive {[weak self] text in
            self?.text = text
        }.disposed(by: disposeBag)
        return self
    }
    func attributedText(_ driver: Driver<NSAttributedString?>) -> Self {
        driver.drive { [weak self] text in
            self?.attributedText = text
        }.disposed(by: disposeBag)
        return self
    }
    func attributedText(_ driver: Driver<NSAttributedString>) -> Self {
        driver.drive { [weak self] text in
            self?.attributedText = text
        }.disposed(by: disposeBag)
        return self
    }
}

extension PageControl: HasDisposeBag {}
public extension PageControl {
    func currentPage(_ driver: Driver<Int>) -> Self {
        driver.drive { [weak self] currentPage in
            self?.currentPage = currentPage
        }.disposed(by: disposeBag)
        return self
    }
}

extension SwitchUI: HasDisposeBag {}
public extension SwitchUI {
    func isOn(_ driver: Driver<Bool>) -> Self {
        driver.drive { [weak self] status in
            self?.isOn = status
        }.disposed(by: disposeBag)
        return self
    }
}

extension TextField: HasDisposeBag {}
public extension TextField {
    func text(_ driver: Driver<String?>) -> Self {
        driver.drive { [weak self] text in
            self?.text = text
        }.disposed(by: disposeBag)
        return self
    }
    func text(_ driver: Driver<String>) -> Self {
        driver.drive { [weak self] text in
            self?.text = text
        }.disposed(by: disposeBag)
        return self
    }
    func attributedText(_ driver: Driver<NSAttributedString?>) -> Self {
        driver.drive { [weak self] text in
            self?.attributedText = text
        }.disposed(by: disposeBag)
        return self
    }
    func attributedText(_ driver: Driver<NSAttributedString>) -> Self {
        driver.drive { [weak self] text in
            self?.attributedText = text
        }.disposed(by: disposeBag)
        return self
    }
    func placeholder(_ driver: Driver<String?>) -> Self {
        driver.drive { [weak self] text in
            self?.placeholder = text
        }.disposed(by: disposeBag)
        return self
    }
    func placeholder(_ driver: Driver<String>) -> Self {
        driver.drive { [weak self] text in
            self?.placeholder = text
        }.disposed(by: disposeBag)
        return self
    }
    func attributedPlaceholder(_ driver: Driver<NSAttributedString?>) -> Self {
        driver.drive { [weak self] text in
            self?.attributedPlaceholder = text
        }.disposed(by: disposeBag)
        return self
    }
    func attributedPlaceholder(_ driver: Driver<NSAttributedString>) -> Self {
        driver.drive { [weak self] text in
            self?.attributedPlaceholder = text
        }.disposed(by: disposeBag)
        return self
    }
}

extension Slider: HasDisposeBag {}
public extension Slider {
    func value(_ driver: Driver<Float>) -> Self {
        driver.drive { [weak self] value in
            self?.value = value
        }.disposed(by: disposeBag)
        return self
    }
}

extension Stepper: HasDisposeBag {}
public extension Stepper {
    func value(_ driver: Driver<Double>) -> Self {
        driver.drive { [weak self] value in
            self?.value = value
        }.disposed(by: disposeBag)
        return self
    }
}

extension ImageView: HasDisposeBag {}
public extension ImageView {
    func image(_ driver: Driver<UIImage?>) -> Self {
        driver.drive { [weak self] image in
            self?.image = image
        }.disposed(by: disposeBag)
        return self
    }
    func image(_ driver: Driver<UIImage>) -> Self {
        driver.drive { [weak self] image in
            self?.image = image
        }.disposed(by: disposeBag)
        return self
    }
}

extension Button: HasDisposeBag {}
public extension Button {
    func title(_ driver: Driver<String?>, for state: UIControl.State) -> Self {
        driver.drive { [weak self] text in
            self?.setTitle(text, for: state)
        }.disposed(by: disposeBag)
        return self
    }
    func title(_ driver: Driver<String>, for state: UIControl.State) -> Self {
        driver.drive { [weak self] text in
            self?.setTitle(text, for: state)
        }.disposed(by: disposeBag)
        return self
    }
    func image(_ driver: Driver<UIImage?>, for state: UIControl.State) -> Self {
        driver.drive { [weak self] image in
            self?.setImage(image, for: state)
        }.disposed(by: disposeBag)
        return self
    }
    func image(_ driver: Driver<UIImage>, for state: UIControl.State) -> Self {
        driver.drive { [weak self] image in
            self?.setImage(image, for: state)
        }.disposed(by: disposeBag)
        return self
    }
    func backgroundImage(_ driver: Driver<UIImage?>, for state: UIControl.State) -> Self {
        driver.drive { [weak self] image in
            self?.setBackgroundImage(image, for: state)
        }.disposed(by: disposeBag)
        return self
    }
    func backgroundImage(_ driver: Driver<UIImage>, for state: UIControl.State) -> Self {
        driver.drive { [weak self] image in
            self?.setBackgroundImage(image, for: state)
        }.disposed(by: disposeBag)
        return self
    }
}
