//
//  CollectionView.swift
//  StackUI
//
//  Created by jiaxin on 2021/10/14.
//

import UIKit

public protocol StackUICollectionView: UICollectionView, StackUIScrollView {
    func collectionViewLayout(_ collectionViewLayout: UICollectionViewLayout) -> Self
    func delegate(_ delegate: UICollectionViewDelegate?) -> Self
    func dataSource(_ dataSource: UICollectionViewDataSource?) -> Self
    @available(iOS 10.0, *)
    func prefetchDataSource(_ prefetchDataSource: UICollectionViewDataSourcePrefetching?) -> Self
    @available(iOS 10.0, *)
    func isPrefetchingEnabled(_ isPrefetchingEnabled: Bool) -> Self
    @available(iOS 11.0, *)
    func dragDelegate(_ dragDelegate: UICollectionViewDragDelegate?) -> Self
    @available(iOS 11.0, *)
    func dropDelegate(_ dropDelegate: UICollectionViewDropDelegate?) -> Self
    @available(iOS 11.0, *)
    func dragInteractionEnabled(_ dragInteractionEnabled: Bool) -> Self
    @available(iOS 11.0, *)
    func reorderingCadence(_ reorderingCadence: UICollectionView.ReorderingCadence) -> Self
    func backgroundView(_ backgroundView: UIView?) -> Self
    func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) -> Self
    func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) -> Self
    func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) -> Self
    func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String) -> Self
    func allowsSelection(_ allowsSelection: Bool) -> Self
    func allowsMultipleSelection(_ allowsMultipleSelection: Bool) -> Self
    func remembersLastFocusedIndexPath(_ remembersLastFocusedIndexPath: Bool) -> Self
    @available(iOS 14.0, *)
    func selectionFollowsFocus(_ selectionFollowsFocus: Bool) -> Self
    @available(iOS 15.0, *)
    func allowsFocus(_ allowsFocus: Bool) -> Self
    @available(iOS 15.0, *)
    func allowsFocusDuringEditing(_ allowsFocusDuringEditing: Bool) -> Self
    @available(iOS 14.0, *)
    func isEditing(_ isEditing: Bool) -> Self
    @available(iOS 14.0, *)
    func allowsSelectionDuringEditing(_ allowsSelectionDuringEditing: Bool) -> Self
    @available(iOS 14.0, *)
    func allowsMultipleSelectionDuringEditing(_ allowsMultipleSelectionDuringEditing: Bool) -> Self
}

public extension StackUICollectionView {
    func collectionViewLayout(_ collectionViewLayout: UICollectionViewLayout) -> Self {
        self.collectionViewLayout = collectionViewLayout
        return self
    }
    func delegate(_ delegate: UICollectionViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    func dataSource(_ dataSource: UICollectionViewDataSource?) -> Self {
        self.dataSource = dataSource
        return self
    }
    @available(iOS 10.0, *)
    func prefetchDataSource(_ prefetchDataSource: UICollectionViewDataSourcePrefetching?) -> Self {
        self.prefetchDataSource = prefetchDataSource
        return self
    }
    @available(iOS 10.0, *)
    func isPrefetchingEnabled(_ isPrefetchingEnabled: Bool) -> Self {
        self.isPrefetchingEnabled = isPrefetchingEnabled
        return self
    }
    @available(iOS 11.0, *)
    func dragDelegate(_ dragDelegate: UICollectionViewDragDelegate?) -> Self {
        self.dragDelegate = dragDelegate
        return self
    }
    @available(iOS 11.0, *)
    func dropDelegate(_ dropDelegate: UICollectionViewDropDelegate?) -> Self {
        self.dropDelegate = dropDelegate
        return self
    }
    @available(iOS 11.0, *)
    func dragInteractionEnabled(_ dragInteractionEnabled: Bool) -> Self {
        self.dragInteractionEnabled = dragInteractionEnabled
        return self
    }
    @available(iOS 11.0, *)
    func reorderingCadence(_ reorderingCadence: UICollectionView.ReorderingCadence) -> Self {
        self.reorderingCadence = reorderingCadence
        return self
    }
    func backgroundView(_ backgroundView: UIView?) -> Self {
        self.backgroundView = backgroundView
        return self
    }
    func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) -> Self {
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
        return self
    }
    func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) -> Self {
        self.register(nib, forCellWithReuseIdentifier: identifier)
        return self
    }
    func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) -> Self {
        self.register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
        return self
    }
    func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String) -> Self {
        self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
        return self
    }
    func allowsSelection(_ allowsSelection: Bool) -> Self {
        self.allowsSelection = allowsSelection
        return self
    }
    func allowsMultipleSelection(_ allowsMultipleSelection: Bool) -> Self {
        self.allowsMultipleSelection = allowsMultipleSelection
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
    @available(iOS 14.0, *)
    func isEditing(_ isEditing: Bool) -> Self {
        self.isEditing = isEditing
        return self
    }
    @available(iOS 14.0, *)
    func allowsSelectionDuringEditing(_ allowsSelectionDuringEditing: Bool) -> Self {
        self.allowsSelectionDuringEditing = allowsSelectionDuringEditing
        return self
    }
    @available(iOS 14.0, *)
    func allowsMultipleSelectionDuringEditing(_ allowsMultipleSelectionDuringEditing: Bool) -> Self {
        self.allowsMultipleSelectionDuringEditing = allowsMultipleSelectionDuringEditing
        return self
    }
}

open class CollectionView: UICollectionView, StackUICollectionView {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
