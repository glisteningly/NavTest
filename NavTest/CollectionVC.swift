//
//  CollectionVC.swift
//  NavTest
//
//  Created by eeefan on 2017/8/30.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionVC: UICollectionViewController {
    var list = [(up: String, down: String)]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.

        list.append(("1", "AAA"))
        list.append(("2", "BBB"))
        list.append(("3", "CCC"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return list.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

        let upLabel = cell.viewWithTag(1) as! UILabel
        let downLabel = cell.viewWithTag(2) as! UILabel

        upLabel.text = list[indexPath.row].up
        downLabel.text = list[indexPath.row].down

        return cell
    }
}
