import SwiftUI

public struct RotationEffect: GeometryEffect {
    public var angle: CGFloat

    public var animatableData: CGFloat {
        get { angle }
        set { angle = newValue }
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(rotationAngle: angle))
    }
}

public struct ScaleYEffect: GeometryEffect {
    public var scaleY: CGFloat

    public var animatableData: CGFloat {
        get { scaleY }
        set { scaleY = newValue }
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(scaleX: 1.0, y: scaleY))
    }
}
