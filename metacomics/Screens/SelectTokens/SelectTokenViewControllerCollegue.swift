import os.log
import UIKit

struct CollectionViewSection<Item> {
    let title: String?
    let number: Int?
    let items: [Item]
}

class SelectTokenViewControllerCollegue: NSObject {

    // MARK: - private properties

    private let imageService = ImageService()
    enum Consts {
        static let minimumInteritemSpacing = 10.0
        static let minimumLineSpacing = 10.0
        static let numberOfCellsPerLine = 3
        static let insetForSection = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }

    // MARK: - public properties

    var sections: [CollectionViewSection<TokenInfo>] = []
    
    // MARK: - callbacks

    var onCellSelected: ((TokenInfo) -> Void)?

}

// MARK: - UICollectionViewDataSource

extension SelectTokenViewControllerCollegue: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TokenImageCell",
            for: indexPath
        ) as? TokenImageCell
        else {
            fatalError()
        }
        let token = section.items[indexPath.item]
        cell.config(image: nil)
        cell.config(with: token.title, subtitle: token.description)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "SelectTokenSectionHeaderView",
                for: indexPath
            ) as? SelectTokenSectionHeaderView
            else {
                fatalError()
            }
            
            let section = sections[indexPath.section]
            headerView.config(
                title: section.title,
                number: section.number != nil ? "\(section.number!)" : nil
            )
            return headerView
        default:
            fatalError("Unexpected element kind in StoryMojiPickerCollegue")
        }
    }

}

// MARK: - UICollectionViewDelegate

extension SelectTokenViewControllerCollegue: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let section = sections[indexPath.section]
        let info = section.items[indexPath.item]
        onCellSelected?(info)
    }
    
    func collectionView(_: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        let info = section.items[indexPath.item]
        if let cell = cell as? TokenImageCell {
            if let url = info.imageUrl {
                cell.indexPath = indexPath
                imageService.loadImage(with: url) { [weak cell] image, _ in
                    guard
                        let image = image,
                        let cell = cell,
                        cell.indexPath == indexPath
                        else {
                            return
                    }
                    cell.config(image: image)
                }
            }
        }
    }

    func collectionView(_: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt _: IndexPath) {
        if let cell = cell as? TokenImageCell {
            cell.config(image: nil)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SelectTokenViewControllerCollegue: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout _: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let number = Consts.numberOfCellsPerLine
        let insets = Consts.insetForSection.left + Consts.insetForSection.right
        let space: CGFloat = Consts.minimumLineSpacing * CGFloat(number - 1) + insets
        let width: CGFloat = (collectionViewWidth - space) / CGFloat(number)
        
        return CGSize(
            width: width,
            height: width + 30.0
        )
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInfo = sections[section]
        return Consts.insetForSection
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout _: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        var height: CGFloat = 0.0
        if let title = sections[section].title, !title.isEmpty {
            height = 30
        }
        return CGSize(
            width: collectionView.frame.width,
            height: height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Consts.minimumLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Consts.minimumInteritemSpacing
    }

}
