//
// MVVM Modelleme 1- View 2- ViewModel 3- Model ; Amaci busniss logic ile ui logic'i ayirmak

// 1- Arayuz tanimlamasi (View Tarafi)
// 2-              (Model tarafi)
// 3- Servis hizmetleri, arka plan hizmetleri
// 4- program icin internetten veri cekmeye yarayan func.
// 5- her view icin bir wiewModel olmasi gerekir, ornek: table view icin bir struct, haberler icin modelden bir sturct, model ile view arasinda kopru gorevi gorecek
// 6- Extension her yerden kullanilabilen eklenti, yazilarin boyutu ayarlamak (Dinamik Yapmak)


import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource { // 1-
   
    private var newsTableViewModel : NewTableViewModel! // 5- bir viewModel olusturmam gerekiyor
    
    @IBOutlet weak var tableView: UITableView! // 1-
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension  // 6- Dinamik gorunum, boyuta gore gorunum
        tableView.estimatedRowHeight = UITableView.automaticDimension   // 6- Dinamik gorunum, boyuta gore gorunum
        
        veriAl()  // 5- Duzen
    }
    func veriAl(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataset/master/dataset.json") // 4- String'ten bir URL olusturduk
        
        WebService().haberleriIndir(url: url!) { (Haberler) in
            if let haberler = Haberler{
                self.newsTableViewModel = NewTableViewModel(newsList: haberler) // NewsTableView olusturuldu, icine haberleri attim
                
                DispatchQueue.main.async {  // 5- gostermeyi asenkron yap
                    self.tableView.reloadData()
                }
            }
        }  //4- WebService blogunu cagirdim, bu islemler yapidiginda bana Haberler diye bir dizi verilecek
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOFRowINSECtion() //5- eger nil ise 0 goster, degil ise olani goster
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! newsCell // 1- newsCell'i cast ettik
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(index: indexPath.row)
        cell.titleLabel.text = newsViewModel.title   // 5- ViewModeldeki yapiyi kullandim
        cell.storyLabel.text = newsViewModel.story   //5- ViewModeldeki yapiyi kullandim
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }  // // 6- Dinamik gorunum, boyuta gore gorunum, 3. aşama, ayrica (Label v.b kutucuklarin ayari onemli)
    
    
    
    
    
    
    
    
    
    
}

