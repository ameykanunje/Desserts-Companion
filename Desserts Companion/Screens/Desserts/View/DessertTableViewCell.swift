//
//  DessertTableViewCell.swift
//  Desserts Companion
//
//  Created by csuftitan on 4/3/24.
//

import UIKit
import Kingfisher

class DessertTableViewCell: UITableViewCell {

    @IBOutlet weak var dessertBackgroundView: UIView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    
    var meals : Meals?{
        didSet{ //property Observer
            configureTableViewCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureTableViewCell(){
        guard let meals else{return}
        mealName.text = meals.strMeal
        setImageView(mealImage, with: meals.strMealThumb)
        
    }
    
    func setImageView(_ imageView: UIImageView, with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: resource)
    }
}
