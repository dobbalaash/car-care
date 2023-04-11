class DashboardViewController: UIViewController {
    var presenter: DashboardPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        // setup the view
    }

    @IBAction func serviceHistoryButtonTapped(_ sender: Any) {
        presenter?.serviceHistoryButtonTapped()
    }
}

class DashboardPresenter {
    private weak var view: DashboardViewController?

    init(view: DashboardViewController) {
        self.view = view
    }

    func serviceHistoryButtonTapped() {
        view?.navigationController?.coordinator?.showServiceHistory()
    }
}
