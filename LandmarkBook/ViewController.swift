//
//  ViewController.swift
//  LandmarkBook
//
//  Created by İrem Sever on 12.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { //Bu iki protokol eklendiği için aşağıdaki fonksiyonları yazıyoruz

    @IBOutlet weak var tableView: UITableView!
    var landmarkName = [String]()
    var countryName = ["Italy", "France", "Russia", "England", "India"]
    var landmarkImg = [UIImage]()
    var chLandmarkName = " "
    var chLandmarkImg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Eklediğimiz protokolleri ekledikten sonra bunları da yazmamız gerekiyor
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkName.append("Colosseum")
        landmarkName.append("Eiffel Tower")
        landmarkName.append("Kremlin Palace")
        landmarkName.append("Stone Henge")
        landmarkName.append("Taj Mahal")
        
        landmarkImg.append(UIImage(named: "colosseum.jpeg")!)
        landmarkImg.append(UIImage(named: "eiffeltower.jpeg")!)
        landmarkImg.append(UIImage(named: "kremlinpalace.jpeg")!)
        landmarkImg.append(UIImage(named: "stonehenge.jpeg")!)
        landmarkImg.append(UIImage(named: "tajmahal.jpeg")!)
        
    }
    
    //Table View için viewcontrollerda eklediğimiz yazıların hata vermesini engellemek için ekleniyor.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkName.count//Kaç adet girdi olacağı
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() //Hücrelerde neler gözükeceğini belirlemek için
        
        //cell.textLabel?.text = "Test"
        var content = cell.defaultContentConfiguration() //Oluşturulan hücreleri düzenleme
        content.text = landmarkName[indexPath.row] //Başlık bu şekilde isim sırayla yazar
        
        content.secondaryText = countryName[indexPath.row] //Alt metin
        cell.contentConfiguration = content
        
        return cell
    }
    //Hücrenin bir sırasına tıklandığında ne olacak
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chLandmarkName = landmarkName [indexPath.row]
        chLandmarkImg = landmarkImg [indexPath.row]
        performSegue(withIdentifier: "ToDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Segue bize verilen değişken
        if segue.identifier == "ToDetailsVC"{
            //Gidilecek hedef var gideceğim yer DetailsVC
            let destVC = segue.destination as! DetailsVC
            destVC.selLandmarkLabel = chLandmarkName
            destVC.selLandmarkImg = chLandmarkImg
        }
    }
    //Listede silme işlemi yapılan fonksiyon
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkName.remove(at: indexPath.row)
            self.landmarkImg.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

