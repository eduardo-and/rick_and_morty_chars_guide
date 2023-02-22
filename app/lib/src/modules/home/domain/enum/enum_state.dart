enum EnumControllerState { success, start, failure, empty, loading }

extension EnumControllerStateExtension on EnumControllerState {
  bool get isSuccess => this == EnumControllerState.success;
  bool get isStart => this == EnumControllerState.start;
  bool get isFailure => this == EnumControllerState.failure;
  bool get isLoading => this == EnumControllerState.failure;
  bool get isEmpty => this == EnumControllerState.empty;
}
