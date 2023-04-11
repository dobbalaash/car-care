// CarEntity.swift
struct CarEntity {
    var make: String
    var model: String
    var serviceRecords: [ServiceRecordEntity]
}

struct ServiceRecordEntity {
    var date: Date
    var serviceType: String
    var cost: Double
}

// CarInteractor.swift
protocol CarInteractorInput {
    func fetchCarInformation()
    func addServiceRecord(serviceType: String, cost: Double)
}

protocol CarInteractorOutput {
    func didFetchCarInformation(car: CarEntity)
    func didAddServiceRecord()
}

class CarInteractor {
    var output: CarInteractorOutput?
    private let carService: CarService
    
    init(carService: CarService) {
        self.carService = carService
    }
    
    func fetchCarInformation() {
        carService.fetchCarInformation { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let car):
                self.output?.didFetchCarInformation(car: car)
            case .failure(let error):
                // handle error
            }
        }
    }
    
    func addServiceRecord(serviceType: String, cost: Double) {
        carService.addServiceRecord(serviceType: serviceType, cost: cost) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.output?.didAddServiceRecord()
            case .failure(let error):
                // handle error
            }
        }
    }
}

// CarPresenter.swift
protocol CarPresenterInput {
    func viewDidLoad()
    func didTapAddServiceRecordButton(serviceType: String, cost: Double)
}

protocol CarPresenterOutput: AnyObject {
    func showCarInformation(car: CarEntity)
    func showServiceRecordAdded()
}

class CarPresenter {
    weak var output: CarPresenterOutput?
    private let interactor: CarInteractorInput
    
    init(interactor: CarInteractorInput) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.fetchCarInformation()
    }
    
    func didTapAddServiceRecordButton(serviceType: String, cost: Double) {
        interactor.addServiceRecord(serviceType: serviceType, cost: cost)
    }
}

extension CarPresenter: CarInteractorOutput {
    func didFetchCarInformation(car: CarEntity) {
        output?.showCarInformation(car: car)
    }
    
    func didAddServiceRecord() {
        output?.showServiceRecordAdded()
    }
}

// CarViewController.swift
class CarViewController: UIViewController {
    var presenter: CarPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func did
