import UIKit

class ViewProfile: UIViewController {
    
    var profile: Profile? = nil
    
    let profileViewModel: ProfileViewModel = ProfileViewModel()
    
    @IBOutlet weak var labelFullName: UILabel!
    @IBOutlet weak var labelWhereFrom: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpView()
        }
    }
    
    func setUpView() async {
        await profileViewModel.getDataFromApi()
        profile = profileViewModel.profileDetail
        setProfileData()
    }
    
    func setProfileData() {
        labelFullName.text = profile!.firstName + ", " + profile!.lastName
        labelWhereFrom.text = profile!.location.city + ", " + profile!.location.state + ", " + profile!.location.country
        labelEmail.text = profile?.email
        labelPhone.text = profile?.phone
        labelGender.text = profile?.gender
        profilePic.image = HelperImage.setImageFromUrl(url: (profile?.picture)!)
        profilePic.layer.cornerRadius = profilePic.frame.size.width / 2
        profilePic.layer.borderWidth = 2
        profilePic.layer.borderColor = UIColor.black.cgColor
    }
}
