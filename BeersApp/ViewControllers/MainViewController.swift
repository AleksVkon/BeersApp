//
//  ViewController.swift
//  BeersApp
//
//  Created by Aleksey Konchyts on 17.03.24.
//

import UIKit

enum UserAction: CaseIterable {
    case getBeer
    
    var title: String {
        switch self {
        case .getBeer:
            "Get Beer!"
        }
        
    }
}

enum Link {
    case getBeerURL
    case ImageURL
    
    var url: URL {
        switch self {
        case .getBeerURL:
            URL(string: "https://api.punkapi.com/v2/beers/192")!
        case .ImageURL:
            URL(string: "https://images.punkapi.com/v2/192.png")!
        }
    }
}

class MainViewController: UICollectionViewController {
    
    let userActions = UserAction.allCases
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath)
        guard let cell = cell as? UserActionCell else { return UICollectionViewCell() }
        cell.userActionLabel.text = userActions[indexPath.item].title
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .getBeer: performSegue(withIdentifier: "userAction", sender: nil)
        }
        
    }

}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: (view.window?.windowScene?.screen.bounds.width ?? 0) - 50,
            height: 150
        )
    }
}

extension MainViewController {
    private func getBeer() {
        URLSession.shared.dataTask(with:  Link.getBeerURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let beer = try JSONDecoder().decode(Beers.self, from: data)
                print(beer)
            } catch {
                print(error)
            }
        }.resume()
    }
}
