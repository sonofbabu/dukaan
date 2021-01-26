//
//  HomeViewController.swift
//  Ducaan.io
//
//  Created by leyo babu on 26/01/21.
//  Copyright © 2021 leyo babu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

// MARK:- IBOUTLETS
    @IBOutlet weak var homeCollectionContainer: UIView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var homeTableViewContainer: UIView!
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeTableViewHeightConstant: NSLayoutConstraint!
    
    
// MARK:- VARIABLES & STATICS DATA
    var sectionArray = [[String]]()
    var sectionPriceArray = [[Int]]()
    var sectionOfferPriceArray = [[Int]]()
    var sectionDiscountArray = [[Int]]()
    var sectionItemAddedArray = [[Int]]()
    var sectionItemCountArray = [[Int]]()
    var sectionHeader = ["Ice Cream","Home Food","Fruit Salads"]
    let item1Array = ["Ice Cream Bowl","Baskin Robbin’s Scoop Cup","Ice Cream Bowl Chocolate","Kwality Walls Black Currant","Ice Cream Bowl","Baskin Robbin’s Scoop Cup","Ice Cream Bowl Chocolate","Kwality Walls Black Currant","Kwality Walls Black Currant","Kwality Walls Black Currant","Kwality Walls Black Currant","Kwality Walls Black Currant"]
    let item2Array = ["Kwality Walls Black Currant","Ice Cream Bowl"]
    let item3Array = ["Ice Cream Bowl Chocolate"]
    let menuItem = ["Ice Cream Bowl","paneer","Ice Cream Bowl Chocolate"]
    let menuItemName = [""]
    let item1Price = [399,0,0,0,399,0,0,0,0,0,0,0]
    let item2Price = [0,0]
    let item3Price = [0]
    let item1OfferPrice = [209,399,249,175,209,399,249,175,175,175,175,175]
    let item2OfferPrice = [175,209]
    let item3OfferPrice = [249]
    let item1Discount = [30,0,0,0,30,0,0,0,0,0,0,0]
    let item2Discount = [0,0]
    let item3Discount = [0]
    let item1Added = [0,0,0,0,3,0,0,0,0,0,0,0]
    let item2Added = [0,0]
    let item3Added = [0]
    let item1Count = [10,0,10,10,10,10,10,10,10,10,10,10]
    let item2Count = [10,10]
    let item3Count = [10]
    var collectionLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var screenWidth = UIScreen.main.bounds.size.width
    var cellHeight = 124
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initMethods()
    }
// MARK:- INIT METHOD
    func initMethods(){
        self.preaparingDataFromArray()
        self.settingCellProperties()
        self.homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "menuItemCell")
        self.homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "menuCell")
        self.homeTableView.isScrollEnabled = false
        self.homeTableView.reloadData()
        let tapGesture = UITapGestureRecognizer(target: self,action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
// MARK:- PREPARE DATA FROM ARRAY
    func preaparingDataFromArray(){ // STATIC DATA IS CREATED AS NO FREE API WAS AVAILABLE
        sectionArray.append(item1Array)
        sectionArray.append(item2Array)
        sectionArray.append(item3Array)
        sectionPriceArray.append(item1Price)
        sectionPriceArray.append(item2Price)
        sectionPriceArray.append(item3Price)
        sectionOfferPriceArray.append(item1OfferPrice)
        sectionOfferPriceArray.append(item2OfferPrice)
        sectionOfferPriceArray.append(item3OfferPrice)
        sectionDiscountArray.append(item1Discount)
        sectionDiscountArray.append(item2Discount)
        sectionDiscountArray.append(item3Discount)
        sectionItemAddedArray.append(item1Added)
        sectionItemAddedArray.append(item2Added)
        sectionItemAddedArray.append(item3Added)
        sectionItemCountArray.append(item1Count)
        sectionItemCountArray.append(item2Count)
        sectionItemCountArray.append(item3Count)
    }
    
    func settingCellProperties(){
        let flow = collectionLayout
        flow.scrollDirection = .horizontal
        flow.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        flow.itemSize = CGSize(width: CGFloat(124), height: CGFloat(cellHeight))
        flow.minimumLineSpacing = 20;
        homeCollectionView.collectionViewLayout = flow
    }

}

// MARK:- Extension Of VC for table view delegate and datasource
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       self.sectionArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.homeTableView.dequeueReusableCell(withIdentifier: "menuItemCell", for: indexPath) as? HomeTableViewCell ?? HomeTableViewCell()
        
        if sectionArray.count > 0 {
            let menuItemName:String = self.sectionArray[indexPath.section][indexPath.row]
            if menuItemName != "" {
                cell.menuItemName.text = menuItemName
            }
            cell.menuItemImage.image = UIImage(named: self.sectionArray[indexPath.section][indexPath.row])
            if sectionOfferPriceArray.count > 0 {
                cell.menuItemOfferPrice.text = "₹\(self.sectionOfferPriceArray[indexPath.section][indexPath.row])"
            }
            if sectionPriceArray.count > 0 {
                let itemPrice = self.sectionPriceArray[indexPath.section][indexPath.row]
                if itemPrice > 0 {
                    let attrString = NSAttributedString(string: "₹\(itemPrice)", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
                    cell.menuItemPrice.attributedText = attrString
                }else {
                    cell.menuItemPrice.text = ""
                }
            }
            if sectionDiscountArray.count > 0 {
                let itemDiscount = self.sectionDiscountArray[indexPath.section][indexPath.row]
                if itemDiscount > 0 {
                    cell.menuOfferView.isHidden = false
                    cell.menuOfferValue.text = "\(itemDiscount)% OFF"
                }else {
                    cell.menuOfferValue.text = ""
                    cell.menuOfferView.isHidden = true
                }
            }
            if sectionItemCountArray.count > 0 {
                let itemCount = sectionItemCountArray[indexPath.section][indexPath.row]
                if itemCount > 0 {
                    if sectionItemAddedArray.count > 0 {
                        let itemAdded = self.sectionItemAddedArray[indexPath.section][indexPath.row]
                        if itemAdded > 0 {
                            cell.menuItemAlreadyAddedView.isHidden = false
                            cell.menuItemAddView.isHidden = true
                            cell.noMenuItemText.isHidden = true
                            cell.menuItemCount.text = "\(itemAdded)"
                        }else {
                            cell.menuItemCount.text = ""
                            cell.noMenuItemText.isHidden = true
                            cell.menuItemAlreadyAddedView.isHidden = true
                            cell.menuItemAddView.isHidden = false
                        }
                    }
                }else{
                    cell.menuItemAlreadyAddedView.isHidden = true
                    cell.menuItemAddView.isHidden = true
                    cell.noMenuItemText.isHidden = false
                }
            }
            
        }
        // determine height and change it
        if indexPath.row == (5 - 1) {
          UIView.animate(withDuration: 0, animations: {
            self.homeTableView.layoutIfNeeded()
          }) { complete in
            // Edit heightOfTableViewConstraint's constant to update height of table view
            self.homeTableViewHeightConstant.constant = self.homeTableView.contentSize.height
          }
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.sectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 25))
        returnedView.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 20, y: 7, width: 100, height: 25))
        label.text = self.sectionHeader[section]
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        let labelSize = label.getSize(constrainedWidth:200.0)
        returnedView.addSubview(label)
        let countView = UIView(frame: CGRect(x: (labelSize.width+30), y: 10, width: 27, height: 19))
        countView.layer.cornerRadius = 4
        countView.backgroundColor = UIColor(hexFromString: "#146eb4")
        returnedView.addSubview(countView)
        let countLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 27, height: 19))
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        countLabel.textColor = .white
        countLabel.text = "\(sectionArray[section].count)"
        countView.addSubview(countLabel)
        
        return returnedView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if sectionArray[section].count > 10 {
            let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
            returnedView.backgroundColor = .white
            let countView = UIView(frame: CGRect(x: view.frame.size.width/4, y: 5, width: view.frame.size.width/2, height: 30))
            countView.backgroundColor = UIColor(hexFromString: "#f2f2f2")
            countView.layer.cornerRadius = 4
            returnedView.addSubview(countView)
            let countLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width/2, height: 30))
            countLabel.textAlignment = .center
            countLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            countLabel.textColor = UIColor(hexFromString: "#4d4d4d")
            countLabel.text = "SEE ALL PRODUCTS >"
            countView.addSubview(countLabel)
            return returnedView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if sectionArray[section].count > 10 {
            return 60
        }else {
            return 0
        }

    }
}

// MARK:- Extension Of VC for Collection view delegate and datasource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sectionHeader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? HomeCollectionViewCell ?? HomeCollectionViewCell()
        cell.menuImage.image = UIImage(named: self.menuItem[indexPath.row])
        cell.menuName.text = sectionHeader[indexPath.row]
        cell.backgroundColor = .red
        return cell
    }
    
    
}


extension UILabel {
    func getSize(constrainedWidth: CGFloat) -> CGSize {
        return systemLayoutSizeFitting(CGSize(width: constrainedWidth, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }
}
