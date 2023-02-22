enum EnumListState{
  start,
  loading ,
  finished,
  success
}

extension EnumListStateExtension on EnumListState {
   bool get isStart => this == EnumListState.start;
   bool get isSuccess => this == EnumListState.success;
   bool get isFinished => this == EnumListState.finished;
   bool get isloading => this == EnumListState.loading ;
}


