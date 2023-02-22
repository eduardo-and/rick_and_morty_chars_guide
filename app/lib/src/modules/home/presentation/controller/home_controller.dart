import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import 'package:rick_and_morty_guide/src/core/domain/entities/character_entity.dart';
import 'package:rick_and_morty_guide/src/modules/home/domain/enum/enum_list_state.dart';
import 'package:rick_and_morty_guide/src/modules/home/domain/enum/enum_state.dart';
import 'package:rick_and_morty_guide/src/modules/home/domain/usecases/get_characters_usecase.dart';

import '../../../../app_provider.dart';
import '../../../../core/domain/entities/filter_entity.dart';

part 'home_controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetCharactersUsecase _getCharactersUsecase =
      getIt<GetCharactersUsecase>();

  @observable
  List<Character> _characters = <Character>[].asObservable();

  @observable
  int _page = 1;

  @observable
  String search = '';

  @observable
  EnumControllerState controllerState = EnumControllerState.start;

  @observable
  EnumListState listState = EnumListState.start;

  @observable
  late Filter filters = Filter();

  int? totalPages;

  @action
  handleTapFavorite(int id) {
    int index = _characters.indexWhere((element) => element.id == id);
    _characters[index].isFavorite = !_characters[index].isFavorite;
    _characters = _characters;
  }

  @action
  setSearchText(String value) {
    return search = value;
  }

  @action
  handleFilter(Filter filter) {
    _characters = _characters;
    return filters = filter;
  }

  @action
  Future<void> getCharacters() async {
    if (!listState.isloading ||
        _page <= (totalPages ?? 0) ||
        _page == (totalPages ?? 0)) {
      try {
        listState = EnumListState.loading;

        _page++;
        var response = await _getCharactersUsecase(page: _page);

        List<Character> chars =
            response.fold((l) => throw l, (r) => r).asObservable();

        for (var char in chars) {
          _characters.add(char);
        }
      } catch (_) {
        debugPrint('Falha ao obter itens');
      } finally {
        await Future.delayed(const Duration(milliseconds: 300));
        listState = EnumListState.success;
      }
    }
  }

  @computed
  List<Character> get favoriteCharacters =>
      characters.where((char) => char.isFavorite).toList();

  @computed
  List<Character> get characters {
    List<Character> chars = _characters.toList();
    List<Character> charsFiltered = [];
    if (search != '') {
      charsFiltered = chars
          .where(
              (char) => char.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    if (filters.monsters) {
      charsFiltered += chars
          .where((char) => char.type.toLowerCase().contains('monster'))
          .toList();
    }

    if (filters.humans) {
      charsFiltered += chars
          .where((char) => char.type.toLowerCase().contains('human'))
          .toList();
    }

    if (filters.parasite) {
      charsFiltered += chars
          .where((char) => char.type.toLowerCase().contains('parasite'))
          .toList();
    }

    if (search == '' && filters.isDefault) return chars;

    return charsFiltered;
  }

  // List<Character> applyFilters(List<Character> chars) {}

  // return chars;
  // if(filters['monster']!)
  //   chars =  chars.removeWhere((char) => char.type=='monster');
  // if(filters['monster']!)
  //   chars =  chars.removeWhere((char) => char.type=='monster');
  // }
  @action
  Future<void> pipeline() async {
    if (!controllerState.isLoading) {
      try {
        controllerState = EnumControllerState.loading;
        var response = await _getCharactersUsecase();

        _characters = response.fold((l) => throw l, (r) => r).asObservable();

        getCharacters();
        controllerState = EnumControllerState.success;
      } catch (e) {
        controllerState = EnumControllerState.failure;
      }
    }
  }
}
