public extension ScannerViewController {

    struct ScannerConfig: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        public static let targetBraces = ScannerConfig(rawValue: 1 << 0)
        public static let torch = ScannerConfig(rawValue: 1 << 1)
        public static let manualCapture = ScannerConfig(rawValue: 1 << 2)
        public static let progressBar = ScannerConfig(rawValue: 1 << 3)

        public static let all: ScannerConfig = [
            .targetBraces,
            .torch,
            .manualCapture,
            .progressBar
        ]
    }
}
