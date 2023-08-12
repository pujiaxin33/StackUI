//
//  StackView.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/11.
//

import UIKit

@resultBuilder
public struct ViewBuilder {
    public typealias Expression = UIView
    public typealias Component = [UIView]
    public static func buildExpression(_ expression: Expression) -> Component {
        return [expression]
    }
    public static func buildBlock(_ components: Component...) -> Component {
        return components.flatMap { $0 }
    }
    public static func buildBlock(_ components: UIView...) -> Component {
        return components.map { $0 }
    }
    public static func buildOptional(_ component: Component?) -> Component {
        return component ?? []
    }
    public static func buildEither(first component: Component) -> Component {
        return component
    }
    public static func buildEither(second component: Component) -> Component {
        return component
    }
    public static func buildArray(_ components: [Component]) -> Component {
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
    public let scrollView: UIScrollView
    public init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @ViewBuilder views: () -> [UIView]) {
        
        let views = views()
        scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        stackView = UIStackView(arrangedSubviews: views)
        views.forEach { view in
            if let spacer = view as? Spacer {
                spacer.axis = .horizontal
            }
            if let divider = view as? Divider {
                divider.axis = .horizontal
            }
        }
        stackView.axis = .horizontal
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.spacing = spacing
        super.init(frame: .zero)

        scrollView.embed(in: self)
        stackView.embed(in: scrollView, ignoreSafeArea: true)
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func applyScrollView(_ config: (UIScrollView)->() ) -> Self {
        config(scrollView)
        return self
    }
}

/// The width and height of `VScrollStack` is required
open class VScrollStack: UIView, StackUIView {
    private let stackView: UIStackView
    public let scrollView: UIScrollView
    public init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @ViewBuilder views: () -> [UIView]) {
        
        let views = views()
        scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        stackView = UIStackView(arrangedSubviews: views)
        views.forEach { view in
            if let spacer = view as? Spacer {
                spacer.axis = .vertical
            }
            if let divider = view as? Divider {
                divider.axis = .vertical
            }
        }
        stackView.axis = .vertical
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.spacing = spacing
        super.init(frame: .zero)
        
        scrollView.embed(in: self)
        stackView.embed(in: scrollView, ignoreSafeArea: true)
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func applyScrollView(_ config: (UIScrollView)->() ) -> Self {
        config(scrollView)
        return self
    }
}
