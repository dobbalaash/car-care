class DashboardViewController: UIViewController {
    var presenter: DashboardPresenter?

    @IBOutlet weak var serviceHistoryButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        serviceHistoryButton.addTarget(self, action: #selector(serviceHistoryButtonTapped), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
    }

    @objc func serviceHistoryButtonTapped() {
        presenter?.serviceHistoryButtonTapped()
    }

    @objc func settingsButtonTapped() {
        presenter?.settingsButtonTapped()
    }
}
