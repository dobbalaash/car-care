class CarPresenter: CarPresenterInput {
    weak var view: CarView?
    var interactor: CarInteractorInput
    var coordinator: CarCoordinatorInput

    // ...
    func viewDidLoad() {
        interactor.fetchCarData()
    }

    func didPressServiceHistoryButton() {
        coordinator.showServiceHistory()
    }
    // ...
}
