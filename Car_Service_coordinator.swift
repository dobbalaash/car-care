class CarServiceCoordinator {
    private let navigationController: UINavigationController
    private let carService: CarService

    init(navigationController: UINavigationController, carService: CarService) {
        self.navigationController = navigationController
        self.carService = carService
    }

    func start() {
        let dashboardViewController = DashboardViewController()
        let dashboardPresenter = DashboardPresenter(carService: carService)
        dashboardViewController.presenter = dashboardPresenter
        dashboardPresenter.view = dashboardViewController
        navigationController.pushViewController(dashboardViewController, animated: false)
    }

    func showServiceHistory() {
        let serviceHistoryViewController = ServiceHistoryViewController()
        let serviceHistoryPresenter = ServiceHistoryPresenter(carService: carService)
        serviceHistoryViewController.presenter = serviceHistoryPresenter
        serviceHistoryPresenter.view = serviceHistoryViewController
        navigationController.pushViewController(serviceHistoryViewController, animated: true)
    }

    func showSettings() {
        let settingsViewController = SettingsViewController()
        let settingsPresenter = SettingsPresenter(carService: carService)
        settingsViewController.presenter = settingsPresenter
        settingsPresenter.view = settingsViewController
        navigationController.pushViewController(settingsViewController, animated: true)
    }
}

class DashboardViewController: UIViewController {
    var presenter: DashboardPresenter?

    @IBAction func serviceHistoryButtonTapped(_ sender: Any) {
        presenter?.showServiceHistory()
    }

    @IBAction func settingsButtonTapped(_ sender: Any) {
        presenter?.showSettings()
    }
}

class DashboardPresenter {
    private weak var view: DashboardViewController?
    private let carService: CarService

    init(carService: CarService) {
        self.carService = carService
    }

    func showServiceHistory() {
        view?.navigationController?.coordinator?.showServiceHistory()
    }

    func showSettings() {
        view?.navigationController?.coordinator?.showSettings()
    }
}

class ServiceHistoryViewController: UIViewController {
    var presenter: ServiceHistoryPresenter?

    // display service history
}

class ServiceHistoryPresenter {
    private weak var view: ServiceHistoryViewController?
    private let carService: CarService

    init(carService: CarService) {
        self.carService = carService
    }

    // fetch and update service history
}

class SettingsViewController: UIViewController {
    var presenter: SettingsPresenter?

    // display settings
}

class SettingsPresenter {
    private weak var view: SettingsViewController?
    private let carService: CarService

    init(carService: CarService) {
        self.carService = carService
    }

    // fetch and update settings
}
