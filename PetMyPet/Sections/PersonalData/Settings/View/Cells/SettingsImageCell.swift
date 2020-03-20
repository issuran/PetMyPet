//
//  SettingsImageCell.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 20/02/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class SettingsImageCell: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imgOne: PMPButton!
    @IBOutlet weak var imgTwo: PMPButton!
    @IBOutlet weak var imgThree: PMPButton!
    
    var tempButton: PMPButton!
    var imagePicker = UIImagePickerController()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func chooseFirstImageAction(_ sender: Any) {
        tempButton = imgOne
        selectOriginSource()
    }
    
    @IBAction func chooseSecondImageAction(_ sender: Any) {
        tempButton = imgTwo
        selectOriginSource()
    }
    
    @IBAction func chooseThirdImageAction(_ sender: Any) {
        tempButton = imgThree
        selectOriginSource()
    }
    
    func selectOriginSource() {
        let alert = UIAlertController(title: "Selecione a image",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Galeria", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.parentViewController?.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if (UIImagePickerController .isSourceTypeAvailable(.camera)) {
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            self.parentViewController?.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Aviso", message: "Você não possui camera.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.parentViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        if (UIImagePickerController .isSourceTypeAvailable(.photoLibrary)) {
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            self.parentViewController?.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Aviso", message: "Você não possui acesso a galeria.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.parentViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            self.tempButton.setImage(pickedImage, for: .normal)
            self.tempButton.contentMode = .scaleAspectFit
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if parentResponder is UIViewController {
                return parentResponder as! UIViewController?
            }
        }
        return nil
    }
}
