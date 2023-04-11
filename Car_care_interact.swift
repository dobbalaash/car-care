class CarDashboardCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let view = CarDashboardViewController()
        let interactor = CarDashboardInteractor()
        let presenter = CarDashboardPresenter(view: view, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}

class CarDashboardViewController: UIViewController, CarDashboardView {
    var presenter: CarDashboardPresenter?

    func showCarInfo(car: Car) {
        //update the view with the car's information
    }
}

class CarDashboardInteractor: CarDashboardInteractorInput {
    var presenter: CarDashboardPresenter?
    var carService: CarService

    func fetchCarInfo() {
        let car = carService.getCar()
        presenter?.carFetched(car: car)
    }
}

class CarDashboardPresenter: CarDashboardPresenterInput {
    weak var view: CarDashboardView?
    var interactor: CarDashboardInteractorInput

    init(view: CarDashboardView, interactor: CarDashboardInteractorInput) {
        self.view = view
        self.interactor = interactor
    }

    func viewDidLoad() {
        interactor.fetchCarInfo()
    }

    func carFetched(car: Car) {
        view?.showCarInfo(car: car)
    }
}
