import Combine
import UIKit
import web3swift

class BigButtonViewController: UIViewController {
    
    // MARK: - outlets
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var bigButton: UIButton!
    @IBOutlet private var statusLabel: UILabel!

    // MARK: - private properties
    
    private var cancellable: AnyCancellable?
    
    private var walletAddress: String = "0x58Ae6515A2d8464cbDb3d68ff3a5B1B4c774e9e2"

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        statusLabel.text = nil
        activityIndicator.stopAnimating()
    }
    
    private func next() {

    }
    
    // MARK: - web3 actions
    
    private func getBalance(address: String) {
        DispatchQueue.global().async {
            do {
                let providerUrlString = "https://polygon-mumbai.g.alchemy.com/v2/GlRUiAxYwFVvUrRpt9uUmuArSZ4bDblP"
                let providerUrl = URL(string: providerUrlString)!
                guard let provider = Web3HttpProvider(providerUrl) else { return }
                let web3 = web3(provider: provider)
                
//                let web3 = Web3.InfuraRinkebyWeb3()
                
                let address = EthereumAddress(address)!
                let balance = try web3.eth.getBalance(address: address)
                guard let balanceString = Web3.Utils.formatToEthereumUnits(balance, toUnits: .eth, decimals: 3)
                else { return }
                DispatchQueue.main.async {
                    self.statusLabel.text = "Balance: \(balanceString)"
                    self.activityIndicator.stopAnimating()
                }

            } catch {
                DispatchQueue.main.async {
                    self.statusLabel.text = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func callContractMethod(address: String) {
        DispatchQueue.global().async {
            do {
                let providerUrlString = "https://polygon-mumbai.g.alchemy.com/v2/GlRUiAxYwFVvUrRpt9uUmuArSZ4bDblP"
                let providerUrl = URL(string: providerUrlString)!
                guard let provider = Web3HttpProvider(providerUrl) else { return }
                let web3 = web3(provider: provider)
                
//                let web3 = Web3.InfuraRinkebyWeb3()
                
                let value: String = "0.0" // Any amount of Ether you need to send
                let walletAddress = EthereumAddress(address)! // Your wallet address
                
                // contract
                guard let url = Bundle.main.url(forResource: "Contract", withExtension: "json") else { return }
                let json = try Data(contentsOf: url)
                let string = String(data: json, encoding: String.Encoding.utf8)
                let contractABI = string ?? "" // Contract ABI
                let contractAddress = EthereumAddress("0x93919cf5981de7c24a303e07f56f4eefa57454bb")!
                let abiVersion = 2 // Contract ABI version
                let contractMethod = "howManyKittensCalled" // Contract method you want to write
                let parameters: [AnyObject] = ["fred" as AnyObject] // Parameters for contract method
                let extraData: Data = Data() // Extra data for contract method
                let contract = web3.contract(contractABI, at: contractAddress, abiVersion: abiVersion)!
                
                
                let amount = Web3.Utils.parseToBigUInt(value, units: .eth)
                var options = TransactionOptions.defaultOptions
                options.value = amount
                options.from = walletAddress
                options.gasPrice = .automatic
                options.gasLimit = .automatic
                
                guard let tx = contract.read(
                  contractMethod,
                  parameters: parameters,
                  extraData: extraData,
                  transactionOptions: options)
                else { return }
                
                let result = try tx.call()
                DispatchQueue.main.async {
                    self.statusLabel.text = "Result: \(result)"
                    self.activityIndicator.stopAnimating()
                }

            } catch {
                DispatchQueue.main.async {
                    self.statusLabel.text = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func oldLibMethod() {
//        let urlString = "https://eth-rinkeby.alchemyapi.io/v2/XumJjnNzRjAI7hB9_IYDhrHdjChHTm2C"
//        let urlString = "https://eth-rinkeby.alchemyapi.io/v2/xf47xT9DETQAl3E1IDZ06HaPKmf90q-M"
        
//        guard let clientUrl = URL(string: urlString) else { return }
//
//        let client = EthereumClient(url: clientUrl)
//
//        client.eth_gasPrice { error, currentPrice in
//            print("The current gas price is \(currentPrice)")
//            DispatchQueue.main.async {
//                if let error = error {
//                    self.statusLabel.text = "Error: \(error.localizedDescription)"
//                } else {
//                    self.statusLabel.text = "The current gas price is \(currentPrice)"
//                }
//            }
//        }
//
//        client.net_version { error, network in
//            if let error = error {
//                DispatchQueue.main.async {
//                    self.statusLabel.text = "Error: \(error.localizedDescription)"
//                }
//                return
//            }
//            guard let network = network else { return }
//            DispatchQueue.main.async {
//                self.statusLabel.text = "Network: \(network)"
//            }
//        }
//
//        let contractAddress = EthereumAddress("0x93919cf5981de7c24a303e07f56f4eefa57454bb")
//        let abiUrl = Bundle.main.url(forResource: "Contract", withExtension: "json")!
//        let contract = EthereumJSONContract(url: abiUrl, address: contractAddress)!
    }
    
    // MARK: - Actions
    
    @IBAction func bigButtonTapped() {
        activityIndicator.startAnimating()
        
        getBalance(address: walletAddress)
//        callContractMethod(address: walletAddress)
    }

}
