//
//  ScrollView.swift
//  StackUI
//
//  Created by jiaxin on 2021/10/14.
//

import UIKit

public protocol StackUIScrollView: UIScrollView, StackUIView {
    func contentOffset(_ contentOffset: CGPoint) -> Self
    func contentSize(_ contentSize: CGSize) -> Self
    func contentInset(_ contentInset: UIEdgeInsets) -> Self
    @available(iOS 11.0, *)
    func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self
    @available(iOS 13.0, *)
    func automaticallyAdjustsScrollIndicatorInsets(_ automaticallyAdjustsScrollIndicatorInsets: Bool) -> Self
    func delegate(_ delegate: UIScrollViewDelegate?) -> Self
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> Self
    func bounces(_ bounces: Bool) -> Self
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Self
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Self
    func isPagingEnabled(_ isPagingEnabled: Bool) -> Self
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self
    func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle) -> Self
    @available(iOS 11.1, *)
    func verticalScrollIndicatorInsets(_ verticalScrollIndicatorInsets: UIEdgeInsets) -> Self
    @available(iOS 11.1, *)
    func horizontalScrollIndicatorInsets(_ horizontalScrollIndicatorInsets: UIEdgeInsets) -> Self
    func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> Self
    func decelerationRate(_ decelerationRate: UIScrollView.DecelerationRate) -> Self
    func indexDisplayMode(_ indexDisplayMode: UIScrollView.IndexDisplayMode) -> Self
    func delaysContentTouches(_ delaysContentTouches: Bool) -> Self
    func canCancelContentTouches(_ canCancelContentTouches: Bool) -> Self
    func minimumZoomScale(_ minimumZoomScale: CGFloat) -> Self
    func maximumZoomScale(_ maximumZoomScale: CGFloat) -> Self
    func zoomScale(_ zoomScale: CGFloat) -> Self
    func bouncesZoom(_ bouncesZoom: Bool) -> Self
    func scrollsToTop(_ scrollsToTop: Bool) -> Self
    func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode) -> Self
    @available(iOS 10.0, *)
    func refreshControl(_ refreshControl: UIRefreshControl?) -> Self
}

public extension StackUIScrollView {
    func contentOffset(_ contentOffset: CGPoint) -> Self {
        self.contentOffset = contentOffset
        return self
    }
    func contentSize(_ contentSize: CGSize) -> Self {
        self.contentSize = contentSize
        return self
    }
    func contentInset(_ contentInset: UIEdgeInsets) -> Self {
        self.contentInset = contentInset
        return self
    }
    @available(iOS 11.0, *)
    func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        self.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }
    @available(iOS 13.0, *)
    func automaticallyAdjustsScrollIndicatorInsets(_ automaticallyAdjustsScrollIndicatorInsets: Bool) -> Self {
        self.automaticallyAdjustsScrollIndicatorInsets = automaticallyAdjustsScrollIndicatorInsets
        return self
    }
    func delegate(_ delegate: UIScrollViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> Self {
        self.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }
    func bounces(_ bounces: Bool) -> Self {
        self.bounces = bounces
        return self
    }
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Self {
        self.alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Self {
        self.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    func isPagingEnabled(_ isPagingEnabled: Bool) -> Self {
        self.isPagingEnabled = isPagingEnabled
        return self
    }
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self {
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self {
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle) -> Self {
        self.indicatorStyle = indicatorStyle
        return self
    }
    @available(iOS 11.1, *)
    func verticalScrollIndicatorInsets(_ verticalScrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.verticalScrollIndicatorInsets = verticalScrollIndicatorInsets
        return self
    }
    @available(iOS 11.1, *)
    func horizontalScrollIndicatorInsets(_ horizontalScrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets
        return self
    }
    func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.scrollIndicatorInsets = scrollIndicatorInsets
        return self
    }
    func decelerationRate(_ decelerationRate: UIScrollView.DecelerationRate) -> Self {
        self.decelerationRate = decelerationRate
        return self
    }
    func indexDisplayMode(_ indexDisplayMode: UIScrollView.IndexDisplayMode) -> Self {
        self.indexDisplayMode = indexDisplayMode
        return self
    }
    func delaysContentTouches(_ delaysContentTouches: Bool) -> Self {
        self.delaysContentTouches = delaysContentTouches
        return self
    }
    func canCancelContentTouches(_ canCancelContentTouches: Bool) -> Self {
        self.canCancelContentTouches = canCancelContentTouches
        return self
    }
    func minimumZoomScale(_ minimumZoomScale: CGFloat) -> Self {
        self.minimumZoomScale = minimumZoomScale
        return self
    }
    func maximumZoomScale(_ maximumZoomScale: CGFloat) -> Self {
        self.maximumZoomScale = maximumZoomScale
        return self
    }
    func zoomScale(_ zoomScale: CGFloat) -> Self {
        self.zoomScale = zoomScale
        return self
    }
    func bouncesZoom(_ bouncesZoom: Bool) -> Self {
        self.bouncesZoom = bouncesZoom
        return self
    }
    func scrollsToTop(_ scrollsToTop: Bool) -> Self {
        self.scrollsToTop = scrollsToTop
        return self
    }
    func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode) -> Self {
        self.keyboardDismissMode = keyboardDismissMode
        return self
    }
    @available(iOS 10.0, *)
    func refreshControl(_ refreshControl: UIRefreshControl?) -> Self {
        self.refreshControl = refreshControl
        return self
    }
}

open class ScrollView: UIScrollView, StackUIScrollView {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
