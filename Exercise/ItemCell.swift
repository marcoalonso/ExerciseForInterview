//
//  ItemCell.swift
//  Exercise
//
//  Created by Marco Alonso Rodriguez on 05/06/23.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var dayOfWeek: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib() 
    }
    
    func setupUI(item: TaskItem){
        titleLabel.text = item.title
        detailsLabel.text = item.details.description
        
        //Map 1 - Lunes , 2 - Martes
        switch item.details.day {
        case 1:
            dayOfWeek.text = "Lunes"
        case 2:
            dayOfWeek.text = "Martes"
        case 3:
            dayOfWeek.text = "Miercoles"
        case 4:
            dayOfWeek.text = "Jueves"
        case 5:
            dayOfWeek.text = "Viernes"
        case 6:
            dayOfWeek.text = "Sabado"
        case 7:
            dayOfWeek.text = "Domingo"
        default:
            print("Day: \(item.details.day)")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
