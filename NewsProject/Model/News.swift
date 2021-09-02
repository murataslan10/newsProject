//
// 2- Model olusturuldu     (Model tarafi)
//

import Foundation

struct News : Decodable {  // decodable disardan alinan verileri koda cevirir, encodable sunucuya veri yollarken , codeable ikisi bir arada 
    let title : String
    let story : String
}







