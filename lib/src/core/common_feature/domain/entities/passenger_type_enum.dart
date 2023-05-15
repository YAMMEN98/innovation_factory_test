enum PassengerTypeEnum{
  adult,
  child,
  infant,
}

extension PassengerTypeExtension on PassengerTypeEnum{
  int get type{
    switch(this){
      case PassengerTypeEnum.adult:
        return 1;
      case PassengerTypeEnum.child:
        return 2;
      case PassengerTypeEnum.infant:
        return 3;
      default:
        return 1;
    }
  }
}