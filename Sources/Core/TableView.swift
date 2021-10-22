//
//  TableView.swift
//  StackUI
//
//  Created by jiaxin on 2021/10/14.
//

import UIKit

public protocol StackUITableView: UITableView, StackUIScrollView {
    func dataSource(_ dataSource: UITableViewDataSource?) -> Self
    func delegate(_ delegate: UITableViewDelegate?) -> Self
    @available(iOS 10.0, *)
    func prefetchDataSource(_ prefetchDataSource: UITableViewDataSourcePrefetching?) -> Self
    @available(iOS 15.0, *)
    func isPrefetchingEnabled(_ isPrefetchingEnabled: Bool) -> Self
    @available(iOS 11.0, *)
    func dragDelegate(_ dragDelegate: UITableViewDragDelegate?) -> Self
    @available(iOS 11.0, *)
    func dropDelegate(_ dropDelegate: UITableViewDropDelegate?) -> Self
    func rowHeight(_ rowHeight: CGFloat) -> Self
    func sectionHeaderHeight(_ sectionHeaderHeight: CGFloat) -> Self
    func sectionFooterHeight(_ sectionFooterHeight: CGFloat) -> Self
    func estimatedRowHeight(_ estimatedRowHeight: CGFloat) -> Self
    func estimatedSectionHeaderHeight(_ estimatedSectionHeaderHeight: CGFloat) -> Self
    func estimatedSectionFooterHeight(_ estimatedSectionFooterHeight: CGFloat) -> Self
    @available(iOS 15.0, *)
    func fillerRowHeight(_ fillerRowHeight: CGFloat) -> Self
    @available(iOS 15.0, *)
    func sectionHeaderTopPadding(_ sectionHeaderTopPadding: CGFloat) -> Self
    func separatorInset(_ separatorInset: UIEdgeInsets) -> Self
    @available(iOS 11.0, *)
    func separatorInsetReference(_ separatorInsetReference: UITableView.SeparatorInsetReference) -> Self
    func backgroundView(_ backgroundView: UIView?) -> Self
    func isEditing(_ isEditing: Bool) -> Self
    func allowsSelection(_ allowsSelection: Bool) -> Self
    func allowsSelectionDuringEditing(_ allowsSelectionDuringEditing: Bool) -> Self
    func allowsMultipleSelection(_ allowsMultipleSelection: Bool) -> Self
    func allowsMultipleSelectionDuringEditing(_ allowsMultipleSelectionDuringEditing: Bool) -> Self
    func sectionIndexMinimumDisplayRowCount(_ sectionIndexMinimumDisplayRowCount: Int) -> Self
    func sectionIndexColor(_ sectionIndexColor: UIColor?) -> Self
    func sectionIndexBackgroundColor(_ sectionIndexBackgroundColor: UIColor?) -> Self
    func sectionIndexTrackingBackgroundColor(_ sectionIndexTrackingBackgroundColor: UIColor?) -> Self
    func separatorStyle(_ separatorStyle: UITableViewCell.SeparatorStyle) -> Self
    func separatorColor(_ separatorColor: UIColor?) -> Self
    func cellLayoutMarginsFollowReadableWidth(_ cellLayoutMarginsFollowReadableWidth: Bool) -> Self
    @available(iOS 11.0, *)
    func insetsContentViewsToSafeArea(_ insetsContentViewsToSafeArea: Bool) -> Self
    func tableHeaderView(_ tableHeaderView: UIView?) -> Self
    func tableFooterView(_ tableFooterView: UIView?) -> Self
    func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) -> Self
    func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) -> Self
    func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) -> Self
    func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) -> Self
    func remembersLastFocusedIndexPath(_ remembersLastFocusedIndexPath: Bool) -> Self
    @available(iOS 14.0, *)
    func selectionFollowsFocus(_ selectionFollowsFocus: Bool) -> Self
    @available(iOS 15.0, *)
    func allowsFocus(_ allowsFocus: Bool) -> Self
    @available(iOS 15.0, *)
    func allowsFocusDuringEditing(_ allowsFocusDuringEditing: Bool) -> Self
    @available(iOS 11.0, *)
    func dragInteractionEnabled(_ dragInteractionEnabled: Bool) -> Self
}

public extension StackUITableView {
    func dataSource(_ dataSource: UITableViewDataSource?) -> Self {
        self.dataSource = dataSource
        return self
    }
    func delegate(_ delegate: UITableViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    @available(iOS 10.0, *)
    func prefetchDataSource(_ prefetchDataSource: UITableViewDataSourcePrefetching?) -> Self {
        self.prefetchDataSource = prefetchDataSource
        return self
    }
    @available(iOS 15.0, *)
    func isPrefetchingEnabled(_ isPrefetchingEnabled: Bool) -> Self {
        self.isPrefetchingEnabled = isPrefetchingEnabled
        return self
    }
    @available(iOS 11.0, *)
    func dragDelegate(_ dragDelegate: UITableViewDragDelegate?) -> Self {
        self.dragDelegate = dragDelegate
        return self
    }
    @available(iOS 11.0, *)
    func dropDelegate(_ dropDelegate: UITableViewDropDelegate?) -> Self {
        self.dropDelegate = dropDelegate
        return self
    }
    func rowHeight(_ rowHeight: CGFloat) -> Self {
        self.rowHeight = rowHeight
        return self
    }
    func sectionHeaderHeight(_ sectionHeaderHeight: CGFloat) -> Self {
        self.sectionHeaderHeight = sectionHeaderHeight
        return self
    }
    func sectionFooterHeight(_ sectionFooterHeight: CGFloat) -> Self {
        self.sectionFooterHeight = sectionFooterHeight
        return self
    }
    func estimatedRowHeight(_ estimatedRowHeight: CGFloat) -> Self {
        self.estimatedRowHeight = estimatedRowHeight
        return self
    }
    func estimatedSectionHeaderHeight(_ estimatedSectionHeaderHeight: CGFloat) -> Self {
        self.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight
        return self
    }
    func estimatedSectionFooterHeight(_ estimatedSectionFooterHeight: CGFloat) -> Self {
        self.estimatedSectionFooterHeight = estimatedSectionFooterHeight
        return self
    }
    @available(iOS 15.0, *)
    func fillerRowHeight(_ fillerRowHeight: CGFloat) -> Self {
        self.fillerRowHeight = fillerRowHeight
        return self
    }
    @available(iOS 15.0, *)
    func sectionHeaderTopPadding(_ sectionHeaderTopPadding: CGFloat) -> Self {
        self.sectionHeaderTopPadding = sectionHeaderTopPadding
        return self
    }
    func separatorInset(_ separatorInset: UIEdgeInsets) -> Self {
        self.separatorInset = separatorInset
        return self
    }
    @available(iOS 11.0, *)
    func separatorInsetReference(_ separatorInsetReference: UITableView.SeparatorInsetReference) -> Self {
        self.separatorInsetReference = separatorInsetReference
        return self
    }
    func backgroundView(_ backgroundView: UIView?) -> Self {
        self.backgroundView = backgroundView
        return self
    }
    func isEditing(_ isEditing: Bool) -> Self {
        self.isEditing = isEditing
        return self
    }
    func allowsSelection(_ allowsSelection: Bool) -> Self {
        self.allowsSelection = allowsSelection
        return self
    }
    func allowsSelectionDuringEditing(_ allowsSelectionDuringEditing: Bool) -> Self {
        self.allowsSelectionDuringEditing = allowsSelectionDuringEditing
        return self
    }
    func allowsMultipleSelection(_ allowsMultipleSelection: Bool) -> Self {
        self.allowsMultipleSelection = allowsMultipleSelection
        return self
    }
    func allowsMultipleSelectionDuringEditing(_ allowsMultipleSelectionDuringEditing: Bool) -> Self {
        self.allowsMultipleSelectionDuringEditing = allowsMultipleSelectionDuringEditing
        return self
    }
    func sectionIndexMinimumDisplayRowCount(_ sectionIndexMinimumDisplayRowCount: Int) -> Self {
        self.sectionIndexMinimumDisplayRowCount = sectionIndexMinimumDisplayRowCount
        return self
    }
    func sectionIndexColor(_ sectionIndexColor: UIColor?) -> Self {
        self.sectionIndexColor = sectionIndexColor
        return self
    }
    func sectionIndexBackgroundColor(_ sectionIndexBackgroundColor: UIColor?) -> Self {
        self.sectionIndexBackgroundColor = sectionIndexBackgroundColor
        return self
    }
    func sectionIndexTrackingBackgroundColor(_ sectionIndexTrackingBackgroundColor: UIColor?) -> Self {
        self.sectionIndexTrackingBackgroundColor = sectionIndexTrackingBackgroundColor
        return self
    }
    func separatorStyle(_ separatorStyle: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = separatorStyle
        return self
    }
    func separatorColor(_ separatorColor: UIColor?) -> Self {
        self.separatorColor = separatorColor
        return self
    }
    func cellLayoutMarginsFollowReadableWidth(_ cellLayoutMarginsFollowReadableWidth: Bool) -> Self {
        self.cellLayoutMarginsFollowReadableWidth = cellLayoutMarginsFollowReadableWidth
        return self
    }
    @available(iOS 11.0, *)
    func insetsContentViewsToSafeArea(_ insetsContentViewsToSafeArea: Bool) -> Self {
        self.insetsContentViewsToSafeArea = insetsContentViewsToSafeArea
        return self
    }
    func tableHeaderView(_ tableHeaderView: UIView?) -> Self {
        self.tableHeaderView = tableHeaderView
        return self
    }
    func tableFooterView(_ tableFooterView: UIView?) -> Self {
        self.tableFooterView = tableFooterView
        return self
    }
    func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) -> Self {
        self.register(nib, forCellReuseIdentifier: identifier)
        return self
    }
    func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) -> Self {
        self.register(cellClass, forCellReuseIdentifier: identifier)
        return self
    }
    func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) -> Self {
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }
    func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) -> Self {
        self.register(aClass, forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }
    func remembersLastFocusedIndexPath(_ remembersLastFocusedIndexPath: Bool) -> Self {
        self.remembersLastFocusedIndexPath = remembersLastFocusedIndexPath
        return self
    }
    @available(iOS 14.0, *)
    func selectionFollowsFocus(_ selectionFollowsFocus: Bool) -> Self {
        self.selectionFollowsFocus = selectionFollowsFocus
        return self
    }
    @available(iOS 15.0, *)
    func allowsFocus(_ allowsFocus: Bool) -> Self {
        self.allowsFocus = allowsFocus
        return self
    }
    @available(iOS 15.0, *)
    func allowsFocusDuringEditing(_ allowsFocusDuringEditing: Bool) -> Self {
        self.allowsFocusDuringEditing = allowsFocusDuringEditing
        return self
    }
    @available(iOS 11.0, *)
    func dragInteractionEnabled(_ dragInteractionEnabled: Bool) -> Self {
        self.dragInteractionEnabled = dragInteractionEnabled
        return self
    }
}

open class TableView: UITableView, StackUITableView {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
