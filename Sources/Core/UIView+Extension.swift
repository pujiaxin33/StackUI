//
//  UIView+Extension.swift
//  StackUI
//
//  Created by Seyed Samad Gholamzadeh on 8/9/23.
//

import UIKit

public extension UIView {

    @discardableResult
    func embed(in view: UIView, paddings: UIEdgeInsets = .zero, ignoreSafeArea: Bool = false) -> Self {
        view.addSubview(self)

        self.translatesAutoresizingMaskIntoConstraints = false

        let top = ignoreSafeArea ? view.topAnchor : view.safeAreaLayoutGuide.topAnchor
        let leading = ignoreSafeArea ? view.leadingAnchor : view.safeAreaLayoutGuide.leadingAnchor
        let bottom = ignoreSafeArea ? view.bottomAnchor : view.safeAreaLayoutGuide.bottomAnchor
        let trailing = ignoreSafeArea ? view.trailingAnchor : view.safeAreaLayoutGuide.trailingAnchor

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: top, constant: paddings.top),
            self.leadingAnchor.constraint(equalTo: leading, constant: paddings.left),
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddings.bottom),
            self.trailingAnchor.constraint(equalTo: trailing, constant: -paddings.right)
        ])

        return self
    }

    @discardableResult
    func embedToTop(in view: UIView, paddings: UIEdgeInsets = .zero, ignoreSafeArea: Bool = false) -> Self {
        view.addSubview(self)

        self.translatesAutoresizingMaskIntoConstraints = false

        let top = ignoreSafeArea ? view.topAnchor : view.safeAreaLayoutGuide.topAnchor
        let leading = ignoreSafeArea ? view.leadingAnchor : view.safeAreaLayoutGuide.leadingAnchor
        let bottom = ignoreSafeArea ? view.bottomAnchor : view.safeAreaLayoutGuide.bottomAnchor
        let trailing = ignoreSafeArea ? view.trailingAnchor : view.safeAreaLayoutGuide.trailingAnchor

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: top, constant: paddings.top),
            self.leadingAnchor.constraint(equalTo: leading, constant: paddings.left),
            self.bottomAnchor.constraint(lessThanOrEqualTo: bottom, constant: -paddings.bottom),
            self.trailingAnchor.constraint(equalTo: trailing, constant: -paddings.right)
        ])

        return self
    }

    @discardableResult
    func embedToTopLeading(in view: UIView, paddings: UIEdgeInsets = .zero, ignoreSafeArea: Bool = false) -> Self {
        view.addSubview(self)

        self.translatesAutoresizingMaskIntoConstraints = false

        let top = ignoreSafeArea ? view.topAnchor : view.safeAreaLayoutGuide.topAnchor
        let leading = ignoreSafeArea ? view.leadingAnchor : view.safeAreaLayoutGuide.leadingAnchor
        let bottom = ignoreSafeArea ? view.bottomAnchor : view.safeAreaLayoutGuide.bottomAnchor
        let trailing = ignoreSafeArea ? view.trailingAnchor : view.safeAreaLayoutGuide.trailingAnchor

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: top, constant: paddings.top),
            self.leadingAnchor.constraint(equalTo: leading, constant: paddings.left),
            self.bottomAnchor.constraint(lessThanOrEqualTo: bottom, constant: -paddings.bottom),
            self.trailingAnchor.constraint(lessThanOrEqualTo: trailing, constant: -paddings.right)
        ])

        return self
    }

    @discardableResult
    func embedToTopTrailing(in view: UIView, paddings: UIEdgeInsets = .zero, ignoreSafeArea: Bool = false) -> Self {
        view.addSubview(self)

        self.translatesAutoresizingMaskIntoConstraints = false

        let top = ignoreSafeArea ? view.topAnchor : view.safeAreaLayoutGuide.topAnchor
        let leading = ignoreSafeArea ? view.leadingAnchor : view.safeAreaLayoutGuide.leadingAnchor
        let bottom = ignoreSafeArea ? view.bottomAnchor : view.safeAreaLayoutGuide.bottomAnchor
        let trailing = ignoreSafeArea ? view.trailingAnchor : view.safeAreaLayoutGuide.trailingAnchor

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: top, constant: paddings.top),
            self.leadingAnchor.constraint(greaterThanOrEqualTo: leading, constant: paddings.left),
            self.bottomAnchor.constraint(lessThanOrEqualTo: bottom, constant: -paddings.bottom),
            self.trailingAnchor.constraint(equalTo: trailing, constant: -paddings.right)
        ])

        return self
    }

    @discardableResult
    func embedToBottom(in view: UIView, paddings: UIEdgeInsets = .zero, ignoreSafeArea: Bool = false) -> Self {
        view.addSubview(self)

        self.translatesAutoresizingMaskIntoConstraints = false

        let top = ignoreSafeArea ? view.topAnchor : view.safeAreaLayoutGuide.topAnchor
        let leading = ignoreSafeArea ? view.leadingAnchor : view.safeAreaLayoutGuide.leadingAnchor
        let bottom = ignoreSafeArea ? view.bottomAnchor : view.safeAreaLayoutGuide.bottomAnchor
        let trailing = ignoreSafeArea ? view.trailingAnchor : view.safeAreaLayoutGuide.trailingAnchor

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(greaterThanOrEqualTo: top, constant: paddings.top),
            self.leadingAnchor.constraint(equalTo: leading, constant: paddings.left),
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddings.bottom),
            self.trailingAnchor.constraint(equalTo: trailing, constant: -paddings.right)
        ])

        return self
    }

    @discardableResult
    func embedToBottomLeading(in view: UIView, paddings: UIEdgeInsets = .zero, ignoreSafeArea: Bool = false) -> Self {
        view.addSubview(self)

        self.translatesAutoresizingMaskIntoConstraints = false

        let top = ignoreSafeArea ? view.topAnchor : view.safeAreaLayoutGuide.topAnchor
        let leading = ignoreSafeArea ? view.leadingAnchor : view.safeAreaLayoutGuide.leadingAnchor
        let bottom = ignoreSafeArea ? view.bottomAnchor : view.safeAreaLayoutGuide.bottomAnchor
        let trailing = ignoreSafeArea ? view.trailingAnchor : view.safeAreaLayoutGuide.trailingAnchor

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(greaterThanOrEqualTo: top, constant: paddings.top),
            self.leadingAnchor.constraint(equalTo: leading, constant: paddings.left),
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddings.bottom),
            self.trailingAnchor.constraint(lessThanOrEqualTo: trailing, constant: -paddings.right)
        ])

        return self
    }

    @discardableResult
    func embedToBottomTrailing(in view: UIView, paddings: UIEdgeInsets = .zero, ignoreSafeArea: Bool = false) -> Self {
        view.addSubview(self)

        self.translatesAutoresizingMaskIntoConstraints = false

        let top = ignoreSafeArea ? view.topAnchor : view.safeAreaLayoutGuide.topAnchor
        let leading = ignoreSafeArea ? view.leadingAnchor : view.safeAreaLayoutGuide.leadingAnchor
        let bottom = ignoreSafeArea ? view.bottomAnchor : view.safeAreaLayoutGuide.bottomAnchor
        let trailing = ignoreSafeArea ? view.trailingAnchor : view.safeAreaLayoutGuide.trailingAnchor

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(greaterThanOrEqualTo: top, constant: paddings.top),
            self.leadingAnchor.constraint(greaterThanOrEqualTo: leading, constant: paddings.left),
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddings.bottom),
            self.trailingAnchor.constraint(equalTo: trailing, constant: -paddings.right)
        ])

        return self
    }
}
