//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by İrem Sever on 12.04.2023.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var landmarkImg: UIImageView!
    @IBOutlet weak var landmarkName: UILabel!
    
    var selLandmarkLabel = " "
    var selLandmarkImg = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkName.text = selLandmarkLabel
        landmarkImg.image = selLandmarkImg
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
