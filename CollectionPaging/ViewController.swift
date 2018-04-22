//
//  ViewController.swift
//  CollectionPaging
//
//  Created by sanjay kumar chaurasia on 21/04/18.
//  Copyright © 2018 sanjay kumar chaurasia. All rights reserved.
//

import UIKit
import FAPaginationLayout

class ViewController: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var ht_const: NSLayoutConstraint!
    var value = 0
    let ht = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        collectionView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        
        print("in deinit method")
    }
    
    @IBAction func test(_ sender: UIBarButtonItem) {
        value += 1
        if(value%2 == 0){
            self.ht_const.constant = ht-64
        }
        else{
            self.ht_const.constant = ht/2-64
        }
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! FAPaginationLayout
        layout.itemSize =  CGSize(width: width, height: ht-50)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageView.image = UIImage(named: "\(indexPath.item)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize: CGSize = collectionView.bounds.size
        //cellSize.width -= collectionView.contentInset.left
       // cellSize.width -= collectionView.contentInset.right
       // cellSize.height = cellSize.width
        return cellSize
    }
}


