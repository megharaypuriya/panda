
part of internal;

/// The base mixin for every View.
///
/// This mixin need a type parameter of [BaseViewModel].
@internal
@immutable
mixin BaseViewMixin<T extends BaseViewModel> on GetView<T> {
  /// The instance of the ViewModel.
  @protected
  T get viewModel => GetInstance().find<T>(tag: tag);

  /// {@template panda.context}
  ///
  /// The [context] contains information about the location in the
  /// tree at which the associated widget is being built.
  ///
  /// This [context] get defined within [build] method.
  ///
  /// {@endtemplate}
  ///
  /// This is a shorthand for [viewModel.context].
  @protected
  BuildContext get context => viewModel.context;

  /// The widget method which get the place of build method.
  @protected
  Widget? builder();

  /// The Widget build method, don't override this method instead use [builder].
  ///
  /// If do you override this than you'll lose the global context.
  @override
  @protected
  Widget build(final BuildContext context) {
    viewModel._context = context;
    return builder()!;
  }
}
