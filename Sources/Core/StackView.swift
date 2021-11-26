//
//  StackView.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/11.
//

import UIKit

@resultBuilder
public struct ViewBuilder {
    public static func buildExpression(_ expression: UIView) -> [UIView] {
        return [expression]
    }
    public static func buildExpression(_ expression: ()) -> [UIView] {
        return []
    }
    public static func buildBlock(_ components: [UIView]...) -> [UIView] {
        return components.flatMap { $0 }
    }
    public static func buildBlock(_ components: UIView...) -> [UIView] {
        return components.map { $0 }
    }
    public static func buildIf(_ component: [UIView]?) -> [UIView] {
        return component ?? []
    }
    public static func buildEither(first component: [UIView]) -> [UIView] {
        return component
    }
    public static func buildEither(second component: [UIView]) -> [UIView] {
        return component
    }
    public static func buildArray(_ components: [[UIView]]) -> [UIView] {
        Array(components.joined())
    }
}

open class HStack: UIStackView, StackUIView {
    public convenience init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @ViewBuilder views: () -> [UIView]) {
        let views = views()
        self.init(arrangedSubviews: views)
        views.forEach { view in
            if let spacer = view as? Spacer {
                spacer.axis = .horizontal
            }
            if let divider = view as? Divider {
                divider.axis = .horizontal
            }
        }
        axis = .horizontal
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
}

open class VStack: UIStackView, StackUIView {
    public convenience init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @ViewBuilder views: () -> [UIView]) {
        let views = views()
        self.init(arrangedSubviews: views)
        views.forEach { view in
            if let spacer = view as? Spacer {
                spacer.axis = .vertical
            }
            if let divider = view as? Divider {
                divider.axis = .vertical
            }
        }
        axis = .vertical
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
}

/// The width and height of `HScrollStack` is required
open class HScrollStack: UIView, StackUIView {
    private let stackView: UIStackView
    private let scrollView: UIScrollView
    public init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @ViewBuilder views: () -> [UIView]) {
        
        let views = views()
        views.forEach { view in
            if let spacer = view as? Spacer {
                spacer.axis = .horizontal
            }
            if let divider = view as? Divider {
                divider.axis = .horizontal
            }
        }
        scrollView = UIScrollView()
        stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.spacing = spacing
        super.init(frame: .zero)
        
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// The width and height of `VScrollStack` is required
open class VScrollStack: UIView, StackUIView {
    private let stackView: UIStackView
    private let scrollView: UIScrollView
    public init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @ViewBuilder views: () -> [UIView]) {
        
        let views = views()
        views.forEach { view in
            if let spacer = view as? Spacer {
                spacer.axis = .vertical
            }
            if let divider = view as? Divider {
                divider.axis = .vertical
            }
        }
        scrollView = UIScrollView()
        stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.spacing = spacing
        super.init(frame: .zero)
        
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
