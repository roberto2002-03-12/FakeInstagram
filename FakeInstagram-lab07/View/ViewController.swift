import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let postViewModel: PostViewModel = PostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        Task {
            //esperar que carguen los datos
            await setUpData()
        }
    }
    
    func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpData() async {
        //esperar que se obtenga los posts
        await postViewModel.getPosts()
        //refrescar tabla
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //contar cuantas filas hay según cuantos posts haya
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        let post = postViewModel.posts[indexPath.row]
        //establecer valores al post
        cell.lblName.text = "\(post.owner.title.capitalized). \(post.owner.firstName) \(post.owner.lastName)"
        cell.imageProfile.image = HelperImage.setImageFromUrl(url: post.owner.picture)
        cell.imagePost.image = HelperImage.setImageFromUrl(url: post.image)
        cell.lblLikes.text = "\(post.likes) likes"
        cell.lblDesc.text = "\(post.owner.firstName.lowercased()) \(post.text)"
        return cell
    }
}
