// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_input_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserInputCollection on Isar {
  IsarCollection<UserInput> get userInputs => this.collection();
}

const UserInputSchema = CollectionSchema(
  name: r'UserInput',
  id: -2160097124600109534,
  properties: {
    r'inputString': PropertySchema(
      id: 0,
      name: r'inputString',
      type: IsarType.string,
    ),
    r'stringLeft': PropertySchema(
      id: 1,
      name: r'stringLeft',
      type: IsarType.string,
    )
  },
  estimateSize: _userInputEstimateSize,
  serialize: _userInputSerialize,
  deserialize: _userInputDeserialize,
  deserializeProp: _userInputDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userInputGetId,
  getLinks: _userInputGetLinks,
  attach: _userInputAttach,
  version: '3.1.0+1',
);

int _userInputEstimateSize(
  UserInput object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.inputString.length * 3;
  bytesCount += 3 + object.stringLeft.length * 3;
  return bytesCount;
}

void _userInputSerialize(
  UserInput object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.inputString);
  writer.writeString(offsets[1], object.stringLeft);
}

UserInput _userInputDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserInput();
  object.id = id;
  object.inputString = reader.readString(offsets[0]);
  object.stringLeft = reader.readString(offsets[1]);
  return object;
}

P _userInputDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userInputGetId(UserInput object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userInputGetLinks(UserInput object) {
  return [];
}

void _userInputAttach(IsarCollection<dynamic> col, Id id, UserInput object) {
  object.id = id;
}

extension UserInputQueryWhereSort
    on QueryBuilder<UserInput, UserInput, QWhere> {
  QueryBuilder<UserInput, UserInput, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserInputQueryWhere
    on QueryBuilder<UserInput, UserInput, QWhereClause> {
  QueryBuilder<UserInput, UserInput, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserInputQueryFilter
    on QueryBuilder<UserInput, UserInput, QFilterCondition> {
  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> inputStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition>
      inputStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> inputStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> inputStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inputString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition>
      inputStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> inputStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> inputStringContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> inputStringMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inputString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition>
      inputStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition>
      inputStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inputString',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> stringLeftEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition>
      stringLeftGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stringLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> stringLeftLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stringLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> stringLeftBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stringLeft',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition>
      stringLeftStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stringLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> stringLeftEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stringLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> stringLeftContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stringLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition> stringLeftMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stringLeft',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition>
      stringLeftIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringLeft',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterFilterCondition>
      stringLeftIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stringLeft',
        value: '',
      ));
    });
  }
}

extension UserInputQueryObject
    on QueryBuilder<UserInput, UserInput, QFilterCondition> {}

extension UserInputQueryLinks
    on QueryBuilder<UserInput, UserInput, QFilterCondition> {}

extension UserInputQuerySortBy on QueryBuilder<UserInput, UserInput, QSortBy> {
  QueryBuilder<UserInput, UserInput, QAfterSortBy> sortByInputString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputString', Sort.asc);
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterSortBy> sortByInputStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputString', Sort.desc);
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterSortBy> sortByStringLeft() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringLeft', Sort.asc);
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterSortBy> sortByStringLeftDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringLeft', Sort.desc);
    });
  }
}

extension UserInputQuerySortThenBy
    on QueryBuilder<UserInput, UserInput, QSortThenBy> {
  QueryBuilder<UserInput, UserInput, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterSortBy> thenByInputString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputString', Sort.asc);
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterSortBy> thenByInputStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputString', Sort.desc);
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterSortBy> thenByStringLeft() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringLeft', Sort.asc);
    });
  }

  QueryBuilder<UserInput, UserInput, QAfterSortBy> thenByStringLeftDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringLeft', Sort.desc);
    });
  }
}

extension UserInputQueryWhereDistinct
    on QueryBuilder<UserInput, UserInput, QDistinct> {
  QueryBuilder<UserInput, UserInput, QDistinct> distinctByInputString(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inputString', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInput, UserInput, QDistinct> distinctByStringLeft(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stringLeft', caseSensitive: caseSensitive);
    });
  }
}

extension UserInputQueryProperty
    on QueryBuilder<UserInput, UserInput, QQueryProperty> {
  QueryBuilder<UserInput, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserInput, String, QQueryOperations> inputStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inputString');
    });
  }

  QueryBuilder<UserInput, String, QQueryOperations> stringLeftProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stringLeft');
    });
  }
}
