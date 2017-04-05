//
//  RestaurantTableViewController.swift
//  TzuTzu
//
//  Created by Yi-Chin Hsu on 2016/7/27.
//  Copyright © 2016年 Yi-Chin Hsu. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)

        
        cell.accessoryType = restaurants[indexPath.row].isLiked ? .Checkmark : .None
        
        return cell
    }
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet )
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call" + " 123-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
            
        optionMenu.addAction(callAction)
        
        
        let likedAction = UIAlertAction(title: "I like it! ", style: .Default, handler: {
                        (action:UIAlertAction!) -> Void in
            
                        let cell = tableView.cellForRowAtIndexPath(indexPath)
                        cell?.accessoryType = .Checkmark
                        self.restaurantIsLiked[indexPath.row] = true
        
                     })
        
        
        let dontLikeAction = UIAlertAction(title: "I don't like it! ", style: .Destructive, handler:{
        
                        (action: UIAlertAction!) -> Void in
            
                        let cell = tableView.cellForRowAtIndexPath(indexPath)
                        cell?.accessoryType = .None
                        self.restaurantIsLiked[indexPath.row] = false
        
                             })
        
        if restaurantIsLiked[indexPath.row]{
            optionMenu.addAction(dontLikeAction)
        }
        
        else{
            optionMenu.addAction(likedAction)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
    }
    
    */
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
    
        if editingStyle == .Delete {
        
            restaurants.removeAtIndex(indexPath.row)
        
        }
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action, indexPath) -> Void in
            
                let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            
                let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
                self.presentViewController(activityController, animated: true, completion: nil)
                        })
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action, indexPath) -> Void in
            
                self.restaurants.removeAtIndex(indexPath.row)
            
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
                    })
        
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)

        
        return [deleteAction, shareAction]
    
    
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showRestaurantDetail" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
                
            }
            
        }
        
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*
    var restaurantNames = ["椰林燒臘","姐妹花雞排","小木屋鬆餅","女九自助餐","活大麥當勞","八方雲集","四海遊龍","李媽媽麵店","摩斯漢堡","三顧茅廬","大一女自助餐","Subway","全家便利商店","7-11"]
    
    var restaurantImages = ["shaola.jpg", "G.jpg", "waffle.jpg", "g9.jpg", "M.jpg", "8.jpg", "4.jpg", "lee.jpg", "mos.jpg", "3.jpg", "g1.jpg", "sw.jpg", "F.jpg", "711.jpg"]
    
    var restaurantLocations = ["大一女餐廳","小小福","鹿鳴廣場旁","女九餐廳","活大","活大","活大","活大","小福","小福","大一女餐廳","二活","二活","鹿鳴堂"]
    
    var restaurantTypes = ["港式正餐","中式點心","西式點心","中式正餐","西式正餐","中式正餐","中式正餐","中式正餐","日式正餐","中式正餐","中式正餐","西式正餐","便利商店","便利商店"]
    
    var restaurantIsLiked = [Bool](count:14, repeatedValue: false)
    */
    
    var restaurants:[Restaurant] = [
    
    Restaurant(name: "椰林燒臘", type: "港式正餐", location: "大一女餐廳", image: "shaola.jpg", isLiked: false),
    Restaurant(name: "姐妹花雞排", type: "中式點心", location: "小小福", image: "G.jpg", isLiked: false),
    Restaurant(name: "小木屋鬆餅", type: "西式點心", location: "鹿鳴廣場旁", image: "waffle.jpg", isLiked: false),
    Restaurant(name: "女九自助餐", type: "中式正餐", location: "女九餐廳", image: "g9.jpg", isLiked: false),
    Restaurant(name: "活大麥當勞", type: "西式正餐", location: "活大", image: "M.jpg", isLiked: false),
    Restaurant(name: "八方雲集", type: "中式正餐", location: "活大", image: "8.jpg", isLiked: false),
    Restaurant(name: "四海遊龍", type: "中式正餐", location: "活大", image: "4.jpg", isLiked: false),
    Restaurant(name: "摩斯漢堡", type: "日式正餐", location: "小福", image: "mos.jpg", isLiked: false),
    Restaurant(name: "三顧茅廬", type: "中式正餐", location: "小福", image: "3.jpg", isLiked: false),
    Restaurant(name: "大一女自助餐", type: "中式正餐", location: "大一女餐廳", image: "g1.jpg", isLiked: false),
    Restaurant(name: "Subway", type: "西式正餐", location: "二活", image: "sw.jpg", isLiked: false),
    Restaurant(name: "全家便利商店", type: "西式正餐", location: "二活", image: "F.jpg", isLiked: false),
    Restaurant(name: "7-11", type: "西式正餐", location: "小福", image: "711.jpg", isLiked: false)
        
    ]


}
