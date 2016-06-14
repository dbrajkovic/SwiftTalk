public enum HairCleaniness {
    case dirty
    case clean
}

public struct Hair {
    public let percentageOfGrime: Double
    
    public init(percentageOfGrime: Double) {
        self.percentageOfGrime = percentageOfGrime
    }
    
    public func washRinse() -> Hair {
        return Hair(percentageOfGrime: percentageOfGrime - 0.09)
    }
}