//
//  StackView.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/11.
//

import UIKit

private class ContainerView: UIView {
    let items: [UIView]
    init(items: [UIView]) {
        self.items = items
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@resultBuilder
public struct StackBuilder {
    public static func buildBlock(_ children: UIView...) -> [UIView] {
        var result = [UIView]()
        for view in children {
            if let container = view as? ContainerView {
                result.append(contentsOf: container.items)
            }else if let list = view as? ForEachIdentifier {
                result.append(contentsOf: list.items)
            }
            else {
                result.append(view)
            }
        }
        return result
    }
    public static func buildOptional(_ views: [UIView]?) -> UIView {
        return ContainerView(items: views ?? [])
    }
    public static func buildEither(first views: [UIView]) -> UIView {
        return ContainerView(items: views)
    }
    public static func buildEither(second views: [UIView]) -> UIView {
        return ContainerView(items: views)
    }
}

public class ForEach<Data>: UIView where Data : RandomAccessCollection {
    let data: Data
    let items: [UIView]
    public init(_ data: Data, content: @escaping (Data.Element) -> UIView) {
        self.data = data
        var array = [UIView]()
        for item in data {
            let view = content(item)
            array.append(view)
        }
        items = array
        super.init(frame: .zero)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol ForEachIdentifier {
    var items: [UIView] { get }
}
extension ForEach: ForEachIdentifier {}

open class HStack: UIStackView, StackUIView {
    public convenience init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @StackBuilder views: () -> [UIView]) {
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
    public convenience init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @StackBuilder views: () -> [UIView]) {
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

/// `HScrollStack`的宽度和高度必须要明确
open class HScrollStack: UIView, StackUIView {
    private let stackView: UIStackView
    private let scrollView: UIScrollView
    public init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @StackBuilder views: () -> [UIView]) {
        scrollView = UIScrollView()
        let views = views()
        stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.spacing = spacing
        super.init(frame: .zero)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        views.forEach { view in
            if let spacer = view as? Spacer {
                spacer.axis = .horizontal
            }
            if let divider = view as? Divider {
                divider.axis = .horizontal
            }
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = bounds
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// `VScrollStack`的宽度和高度必须要明确
open class VScrollStack: UIView, StackUIView {
    private let stackView: UIStackView
    private let scrollView: UIScrollView
    public init(distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0, @StackBuilder views: () -> [UIView]) {
        scrollView = UIScrollView()
        let views = views()
        stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.spacing = spacing
        super.init(frame: .zero)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        views.forEach { view in
            if let spacer = view as? Spacer {
                spacer.axis = .vertical
            }
            if let divider = view as? Divider {
                divider.axis = .vertical
            }
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = bounds
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
