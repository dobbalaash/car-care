// ServiceHistoryViewController.swift
class ServiceHistoryViewController: UIViewController {
    var presenter: ServiceHistoryPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    func updateView(with serviceHistory: [ServiceRecord]) {
        // Update the view with the service history data
    }

    func showError(_ error: Error) {
        // Show an error message
    }
}
