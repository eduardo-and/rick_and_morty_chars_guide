class Filter {
  final bool monsters;
  final bool humans;
  final bool parasite;

  Filter({this.monsters = false, this.humans = false,this.parasite= false});

  Filter copyWith({bool? monsters, bool? humans,bool? parasite}) {
    return Filter(
      humans: humans ?? this.humans,
      monsters: monsters ?? this.monsters,
      parasite:parasite ?? this.parasite,
    );
  }

   bool get isDefault => !humans && !monsters && !parasite;
}
