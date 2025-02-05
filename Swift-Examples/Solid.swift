// Single Responsibility Principle: Account is responsible for managing balance
struct Account {
    private(set) var balance: Int
    let id: String

    init(id: String, initialBalance: Int = 0) {
        self.id = id
        self.balance = initialBalance
    }

    mutating func credit(_ amount: Int) {
        balance += amount
    }

    mutating func debit(_ amount: Int) throws {
        guard balance >= amount else {
            throw TransactionError.insufficientFunds
        }
        balance -= amount
    }
}

// Open/Closed Principle: New error types can be added without modifying existing code
enum TransactionError: Error {
    case insufficientFunds
    case invalidAmount
    // Other error cases can be added here
}

// Interface Segregation Principle: Separate protocols for different transaction types
protocol CreditProtocol {
    func credit(_ amount: Int, to account: inout Account) throws
}

protocol DebitProtocol {
    func debit(_ amount: Int, from account: inout Account) throws
}

// Single Responsibility Principle: Validator is responsible for validating transactions
struct TransactionValidator {
    static func validateAmount(_ amount: Int) throws {
        guard amount > 0 else {
            throw TransactionError.invalidAmount
        }
    }
}

// Liskov Substitution Principle: TransactionService implements both protocols
class TransactionService: CreditProtocol, DebitProtocol {
    func credit(_ amount: Int, to account: inout Account) throws {
        try TransactionValidator.validateAmount(amount)
        account.credit(amount)
    }

    func debit(_ amount: Int, from account: inout Account) throws {
        try TransactionValidator.validateAmount(amount)
        try account.debit(amount)
    }
}

// Dependency Inversion Principle: High-level modules depend on abstractions
protocol AccountRepositoryProtocol {
    func getAccount(id: String) -> Account?
    func saveAccount(_ account: Account)
}

// Dependency Inversion Principle: Low-level module implements the abstraction
class InMemoryAccountRepository: AccountRepositoryProtocol {
    private var accounts: [String: Account] = [:]

    func getAccount(id: String) -> Account? {
        return accounts[id]
    }

    func saveAccount(_ account: Account) {
        accounts[account.id] = account
    }
}

// Dependency Inversion Principle: BankService depends on abstractions
class BankService {
    private let repository: AccountRepositoryProtocol
    private let transactionService: TransactionService

    init(repository: AccountRepositoryProtocol, transactionService: TransactionService) {
        self.repository = repository
        self.transactionService = transactionService
    }

    func creditAccount(id: String, amount: Int) throws {
        guard var account = repository.getAccount(id: id) else {
            // Handle account not found
            return
        }
        try transactionService.credit(amount, to: &account)
        repository.saveAccount(account)
    }

    func debitAccount(id: String, amount: Int) throws {
        guard var account = repository.getAccount(id: id) else {
            // Handle account not found
            return
        }
        try transactionService.debit(amount, from: &account)
        repository.saveAccount(account)
    }
}
// Create instances
let repository = InMemoryAccountRepository()
let transactionService = TransactionService()
let bankService = BankService(repository: repository, transactionService: transactionService)

// Create an account
let accountId = "12345"
var account = Account(id: accountId, initialBalance: 0)
repository.saveAccount(account)

do {
    // Credit 100 coins
    try bankService.creditAccount(id: accountId, amount: 100)
    print("Successfully credited 100 coins")
    
    // Debit 40 coins
    try bankService.debitAccount(id: accountId, amount: 40)
    print("Successfully debited 40 coins")
    
    // Try to debit 70 coins (which will fail due to insufficient funds)
    try bankService.debitAccount(id: accountId, amount: 70)
} catch TransactionError.insufficientFunds {
    print("Error: Insufficient funds to debit 70 coins")
} catch TransactionError.invalidAmount {
    print("Error: Invalid amount")
} catch {
    print("An unexpected error occurred: \(error)")
}

// Print final balance
if let finalAccount = repository.getAccount(id: accountId) {
    print("Final balance: \(finalAccount.balance) coins")
}
/*
This sample code demonstrates the SOLID principles:
Single Responsibility Principle: Each class/struct has a single responsibility.
Open/Closed Principle: The TransactionError enum can be extended without modifying existing code.
Liskov Substitution Principle: TransactionService implements both CreditProtocol and DebitProtocol.
Interface Segregation Principle: Separate protocols for credit and debit operations.
Dependency Inversion Principle: High-level modules depend on abstractions (protocols) rather than concrete implementations.
This structure allows for easy extension and modification of the banking app while maintaining a clean and modular design.
*