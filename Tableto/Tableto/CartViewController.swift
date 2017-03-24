







import UIKit

struct cellData {
    
    let cell: Int!
    let text: String!
    
}


class CartViewController: UITableViewController {
    
    var myArrayofCellData = [cellData]()
    
    
    
    
    override func viewDidLoad() {
        
        
        myArrayofCellData = [cellData(cell : 1, text : "Drugs"),
                             cellData(cell : 2, text : "Drug1"),
                             cellData(cell : 1, text : "Drug2"),]
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
       return myArrayofCellData.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if myArrayofCellData[indexPath.row].cell == 1 {
            
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainLabel.text = myArrayofCellData[indexPath.row].text
            
            return cell
    
        } else if  myArrayofCellData[indexPath.row].cell == 2 {
            
            
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            
            cell.label1.text = myArrayofCellData[indexPath.row].text
            
            return cell

            
            
            
        } else {
            
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainLabel.text = myArrayofCellData[indexPath.row].text
            
            return cell

            
            
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        
        if myArrayofCellData[indexPath.row].cell == 1 {
            
            return 50
        
        
        } else if  myArrayofCellData[indexPath.row].cell == 2 {
            
            return 50
            
            
        } else {
            
            return 50
                
            
        }

    }
    
    
    
    
}
