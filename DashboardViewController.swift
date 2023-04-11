// DashboardViewController.swift
class DashboardViewController: UIViewController {
    var presenter: DashboardPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    @IBAction func serviceHistoryButtonTapped(_ sender: Any) {
        presenter.serviceHistoryButtonTapped()
    }
}
