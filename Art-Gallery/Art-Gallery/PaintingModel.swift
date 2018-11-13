import Foundation
import UIKit

class PaintingModel: NSObject, UITableViewDataSource, PaintingTableViewCellDelegate {
    
    weak var tableView: UITableView?
    
    var paintings: [Painting] = []
    
    override init() {
        for numbers in 1...12 {
            let images = ("Image\(numbers)")
            guard let image = UIImage(named: images) else { return }
            let thePainting = Painting(image: image)
            paintings.append(thePainting)
        }
    }
    
    func tappedLikeButton(on cell: PaintingTableViewCell) {
        guard let indexPath = tableView?.indexPath(for: cell)
            else { fatalError("Cell does not exist.") }
        
        paintings[indexPath.row].isLiked.toggle()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.tableView = tableView
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintings.count

    }
    
    let reuseIdentifier = "cell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? PaintingTableViewCell else {
            fatalError("Could not cast to cell")
        }
        
        return cell

    }

    
    
}
