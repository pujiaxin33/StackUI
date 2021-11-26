//
//  AnyBuilder.swift
//  StackUI
//
//  Created by tony on 2021/11/26.
//

import Foundation

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
