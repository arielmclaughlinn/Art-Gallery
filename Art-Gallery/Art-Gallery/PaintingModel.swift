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
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
