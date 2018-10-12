extension Array where Element == RectangleFeature {
    // Difference of all elements vs. average
    var jitter: CGFloat {

        let averageElement = self.average

        let diffs = self.map {
            $0.difference(to: averageElement)
        }

        return diffs.reduce(0, +)
    }

    var average: RectangleFeature {
        // Calculates the mean Rectangle Feature. Maybe the median is better...
        return reduce(RectangleFeature(), +) / CGFloat(count)
    }
}
