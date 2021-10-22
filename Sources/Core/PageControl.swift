//
//  PageControl.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/12.
//

import UIKit

public protocol StackUIPageControl: UIPageControl, StackUIControl {
    func numberOfPages(_ numberOfPages: Int) -> Self
    func currentPage(_ currentPage: Int) -> Self
    func currentPage(_ publisher: Publisher<Int>) -> Self
    func hidesForSinglePage(_ hidesForSinglePage: Bool) -> Self
    func pageIndicatorTintColor(_ pageIndicatorTintColor: UIColor?) -> Self
    func currentPageIndicatorTintColor(_ currentPageIndicatorTintColor: UIColor?) -> Self
    @available(iOS 14.0, *)
    func backgroundStyle(_ backgroundStyle: PageControl.BackgroundStyle) -> Self
    @available(iOS 14.0, *)
    func allowsContinuousInteraction(_ allowsContinuousInteraction: Bool) -> Self
    @available(iOS 14.0, *)
    func preferredIndicatorImage(_ preferredIndicatorImage: UIImage?) -> Self
    @available(iOS 14.0, *)
    func indicatorImage(_ image: UIImage?, forPage page: Int) -> Self
    @available(iOS, introduced: 2.0, deprecated: 14.0, message: "updateCurrentPageDisplay no longer does anything reasonable with the new interaction mode.")
    func defersCurrentPageDisplay(_ defersCurrentPageDisplay: Bool) -> Self
}

public extension StackUIPageControl {
    func numberOfPages(_ numberOfPages: Int) -> Self {
        self.numberOfPages = numberOfPages
        return self
    }
    func currentPage(_ currentPage: Int) -> Self {
        self.currentPage = currentPage
        return self
    }
    func currentPage(_ publisher: Publisher<Int>) -> Self {
        publisher.addSubscriber {[weak self] currentPage in
            self?.currentPage = currentPage
        }
        return self
    }
    func hidesForSinglePage(_ hidesForSinglePage: Bool) -> Self {
        self.hidesForSinglePage = hidesForSinglePage
        return self
    }
    func pageIndicatorTintColor(_ pageIndicatorTintColor: UIColor?) -> Self {
        self.pageIndicatorTintColor = pageIndicatorTintColor
        return self
    }
    func currentPageIndicatorTintColor(_ currentPageIndicatorTintColor: UIColor?) -> Self {
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        return self
    }
    @available(iOS 14.0, *)
    func backgroundStyle(_ backgroundStyle: PageControl.BackgroundStyle) -> Self {
        self.backgroundStyle = backgroundStyle
        return self
    }
    @available(iOS 14.0, *)
    func allowsContinuousInteraction(_ allowsContinuousInteraction: Bool) -> Self {
        self.allowsContinuousInteraction = allowsContinuousInteraction
        return self
    }
    @available(iOS 14.0, *)
    func preferredIndicatorImage(_ preferredIndicatorImage: UIImage?) -> Self {
        self.preferredIndicatorImage = preferredIndicatorImage
        return self
    }
    @available(iOS 14.0, *)
    func indicatorImage(_ image: UIImage?, forPage page: Int) -> Self {
        self.setIndicatorImage(image, forPage: page)
        return self
    }
    @available(iOS, introduced: 2.0, deprecated: 14.0, message: "updateCurrentPageDisplay no longer does anything reasonable with the new interaction mode.")
    func defersCurrentPageDisplay(_ defersCurrentPageDisplay: Bool) -> Self {
        self.defersCurrentPageDisplay = defersCurrentPageDisplay
        return self
    }
}

open class PageControl: UIPageControl, StackUIPageControl {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
