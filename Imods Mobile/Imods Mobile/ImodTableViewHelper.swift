//
//  ImodTableViewHelper.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/26/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import UIKit

class TableViewHelper {
    class func EmptyMessage(message:String, viewController:UITableViewController) {
        let messageLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y:0), size: CGSize(width: viewController.view.bounds.size.width, height: viewController.view.bounds.size.height)))
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        viewController.tableView.backgroundView = messageLabel;
        viewController.tableView.separatorStyle = .none;
    }
}
