import Foundation
import UIKit

// Singleton

class FavouritesList
{
    private(set) var favourites:[String]
    
    //static let sharedFavouritesList = FavouritesList()
    
    class func getInstance()->FavouritesList
    {
        return _instance
    }

    private init()
    {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
    } // private constructor
    
    
    private static var _instance: FavouritesList =
    {
        let favouriteList = FavouritesList()
        
        return favouriteList
    }()

    
    func addFavourite(fontName: String) -> Void
    {
        if(!favourites.contains(fontName))
        {
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    func removeFavourite(fontName: String) -> Void
    {
        if let index = favourites.firstIndex(of: fontName) {
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
    private func saveFavourites() -> Void
    {
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
    }
    
    
}

