//
//  ItemsCountCell.swift
//  Test
//
//  Created by Кира on 30.06.2025.
//

import UIKit

struct ItemsCountCellConfig {
    
    let itemsCount: String
    
    fileprivate let layout = ItemsCountCellLayout()
}

// MARK: - TableCellConfig

extension ItemsCountCellConfig: TableCellConfig {
    func update(cell: UITableViewCell) {
        guard let cell = cell as? ItemsCountCell else { return }
        cell.itemsCountLabel.text = itemsCount
        print("\(cell.itemsCountLabel.text)")
        cell.config = self
    }
    
    func height(with size: CGSize) -> CGFloat {
        layout.height(config: self, maxWidth: size.width)
    }
}

// MARK: - Cell

final class ItemsCountCell: UITableViewCell {
    fileprivate var config: Config?
    
    fileprivate let itemsCountLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let layout = config?.layout else { return }
        itemsCountLabel.frame = layout.itemsCountLabelFrame
    }
}

// MARK: - Private

private extension ItemsCountCell {
    func setupCell() {
        setupItemsCountLabel()
    }
    
    func setupItemsCountLabel() {
        contentView.addSubview(itemsCountLabel)
        
        // Добавляем автолейаут для label
        itemsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemsCountLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            itemsCountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        // Базовая настройка label
        itemsCountLabel.font = .reviewCount
        itemsCountLabel.textColor = .reviewCount
    }
}

// MARK: - Layout

private final class ItemsCountCellLayout {
    
    private(set) var itemsCountLabelFrame = CGRect.zero
    
    func height(config: Config, maxWidth: CGFloat) -> CGFloat {
        let width = maxWidth / 2
        itemsCountLabelFrame = CGRect(
            origin: CGPoint(x: width, y: 0),
            size: config.itemsCount.size()
        )
        return itemsCountLabelFrame.maxY
    }
    
    
}
// MARK: - Typealias

fileprivate typealias Config = ItemsCountCellConfig
fileprivate typealias Layout = ItemsCountCellLayout
