import '../../animated_login.dart';
import '../constants/enums/animation_type.dart';

/// [AnimatedComponent] represents a component with its animation type.
class AnimatedComponent {
  /// Default constructor.
  const AnimatedComponent({
    required this.component,
    this.animationType = AnimationType.right,
  });

  /// Represents the component itself.
  final LoginComponents component;

  /// Animation type of the component.
  /// Note that this will only affect the animation in the MOBILE view.
  final AnimationType animationType;
}
