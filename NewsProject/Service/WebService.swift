//
//  3- Servis hizmetleri, arka plan hizmetleri, @escaping
// 4- program icin internetten veri cekmeye yarayan func.
import Foundation

class WebService {
  
    func haberleriIndir(url: URL, completion: @escaping ([News]?) -> ()){ // 3- func. icinde closure parametre olarak vermek istiyorsak, func tamalindaktan sonra veriyi almak istiyorsam, tamamlama blogu yapiyorsak @escaping kullaniyoruz ve News struct'ini cagiriyoruz
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in  //response veri cekme
            if let error = error{       //4-error opsiyonel geliyor
                print(error.localizedDescription) // 4- URLSession: ağ dan veri transferi islemlerini kontrol ediyor. internetten veri istegi
                completion(nil)  // kisaca, hata mesaji varsa sana, haber dizisi donduremicem
                
            } else if let data = data {  // gelen datayi modelimi kullanarak, News dizisine cevirmem gerekiyor
                
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data) // 4- json'dan gelen veriyi decode ettim
                if let haberlerDizisi = haberlerDizisi{ // 4- haberlerDizisini opsiyonelden cikardim
                    completion(haberlerDizisi)  // 4-completion bloguna haberlerDizisini yolladim
                }
                
            }
        }.resume() // 4- devam ettir, butun bu islmeleri baslatmak icin kullaniliyor
        
        
        
        
    }
    
}




