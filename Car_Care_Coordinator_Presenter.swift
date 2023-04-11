class CarCareCoordinator {
    var carService: CarService
    var carDashboardViewController: CarDashboardViewController
    var carServiceHistoryViewController: CarServiceHistoryViewController

    init(carService: CarService) {
        self.carService = carService
        carDashboardViewController = CarDashboardViewController()
        carServiceHistoryViewController = CarServiceHistoryViewController()
    }

    func start() {
        carDashboardViewController.presenter = CarDashboardPresenter(coordinator: self, carService: carService)
        carServiceHistoryViewController.presenter = CarServiceHistoryPresenter(coordinator: self, carService: carService)
        // navigation code to present carDashboardViewController
    }

    func showServiceHistory() {
        // navigation code to present carServiceHistoryViewController
    }
}

class CarDashboardPresenter {
    weak var coordinator: CarCareCoordinator?
    var carService: CarService

    init(coordinator: CarCareCoordinator, carService: CarService) {
        self.coordinator = coordinator
        self.carService = carService
    }

    func viewDidLoad() {
        // update the view with the current service status
    }

    func serviceHistoryButtonTapped() {
        coordinator?.showServiceHistory()
    }
}
