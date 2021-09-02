//
//  5-- her view icin bir wiewModel olmasi gerekir, ornek: table view icin bir struct, haberler icin modelden bir sturct, model ile view arasinda kopru gorevi gorecek//

import Foundation

struct NewTableViewModel {
    let newsList : [News]  // 5- News dizisini newlist'e atadik
    
    func numberOFRowINSECtion() -> Int {  // 5- tableView
        return self.newsList.count
    }
    func newsAtIndexPath( index: Int) -> NewsViewModel {  //5- index dizisini tekile cekiyoruz
        let news = self.newsList[index]  // 5- newList index' ini seciyoruz
        return NewsViewModel(news: news)  // 5- news dondur
    }
}

struct NewsViewModel {
    let news : News
    
    var title : String {
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
}















