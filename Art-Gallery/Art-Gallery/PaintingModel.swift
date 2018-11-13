import Foundation
import UIKit

class PaintingModel: NSObject, UITableViewDataSource, PaintingTableViewCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var paintings: [Painting] = []
    
    
    override init() {
        for number in 1...12 {
            let imageName = ("Image\(number)") // This will be a string with the format "Image1"
            guard let image = UIImage(named: imageName) else { return }
            let thePainting = Painting(image: image)
            paintings.append(thePainting)
        }
    }
    
    func tappedLikeButton(on cell: PaintingTableViewCell) {
        guard let indexPath = tableView?.indexPath(for: cell)
            else { fatalError("Cell does not exist.") }

        paintings[indexPath.row].isLiked.toggle()
        
        var newButtonTitle: String
        if paintings[indexPath.row].isLiked {
            newButtonTitle = "💔"
        } else {
            newButtonTitle = "❤️"
        }
        
        cell.likeButton.setTitle(newButtonTitle, for: .normal)

    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
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
        
        cell.delegate = self
        cell.portraitView.image = paintings[indexPath.row].image
        let title = "❤️"
        cell.likeButton?.setTitle(title, for: .normal)
        cell.likeButton.alpha = paintings[indexPath.row].isLiked ? 1.0 : 0.5
        
        return cell
        
    }
   

    
    
}
