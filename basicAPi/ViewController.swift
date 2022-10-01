
import UIKit

protocol ViewConrollerProtocol {
    func cellDate(date: Nasa)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cosmicDate: Nasa?
    var delegate: ViewConrollerProtocol?
  
    func setup(){
        delegate?.cellDate(date: cosmicDate!)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
        tableView.dataSource = self
        tableView.delegate = self
    }
    let referense = "https://api.nasa.gov/planetary/apod?api_key=8HPmuKQ5fOzg1m5AITtBHNKObE4GXmZphrDYNGoC"
    private func request() {
        guard let url = URL(string:referense) else { return}
        URLSession.shared.dataTask(with: url) { [self] date, response, error in
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
           
            if let error = error {
                print( error)
             return
            }
   
            guard let date = date else { return }
            do{
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let cosmic = try decoder.decode(Nasa.self, from: date)
                self.cosmicDate = cosmic.self
                
                print(cosmic)
           
            }catch{
                print(error)
            }
            }
        } .resume()
       
        }
   
    }

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cosmicDate?.title
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "\(infoVC.self)") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}



    

