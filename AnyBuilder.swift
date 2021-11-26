//
//  AnyBuilder.swift
//  StackUI
//
//  Created by tony on 2021/11/26.
//

import Foundation

@resultBuilder
public struct AnyBuilder<BuilderItem> {
    public static func buildExpression(_ expression: BuilderItem) -> [BuilderItem] {
        return [expression]
    }
    public static func buildExpression(_ expression: ()) -> [BuilderItem] {
        return []
    }
    public static func buildBlock(_ components: [BuilderItem]...) -> [BuilderItem] {
        return components.flatMap { $0 }
    }
    public static func buildBlock(_ components: BuilderItem...) -> [BuilderItem] {
        return components.map { $0 }
    }
    public static func buildIf(_ component: [BuilderItem]?) -> [BuilderItem] {
        return component ?? []
    }
    public static func buildEither(first component: [BuilderItem]) -> [BuilderItem] {
        return component
    }
    public static func buildEither(second component: [BuilderItem]) -> [BuilderItem] {
        return component
    }
    public static func buildArray(_ components: [[BuilderItem]]) -> [BuilderItem] {
        Array(components.joined())
    }
}
