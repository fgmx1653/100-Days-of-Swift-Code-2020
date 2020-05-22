// WARNING: Any changes to this file should be reflected in the literal string in
// AuxiliaryFileContents.swift

import Foundation

// MARK: - Define special types as stand-ins for some protocols and other types

// Replacement for Hashable
private struct _Hashable: Hashable { }

// Replacement for Comparable
private struct _Comparable: Comparable {
	static func < (lhs: _Comparable, rhs: _Comparable) -> Bool {
		return false
	}
}

// Replacement for Optional
private struct _Optional { }

// Replacement for Any
private struct _Any: CustomStringConvertible, LosslessStringConvertible {
	init() { }

	var description: String = ""

	init?(_ description: String) {
		return nil
	}
}

// MARK: - Define the templates
private func gryphonTemplates() {

	// MARK: Declare placeholder variables to use in the templates
	var _bool: Bool = true
	var _strArray: [String] = []
	var _array: [Any] = []
	var _array1: [Any] = []
	var _array2: [Any] = []
	let _array3: [Any] = []
	var _arrayOfOptionals: [Any?] = []
	var _comparableArray: [_Comparable] = []
	let _comparable = _Comparable()
	var _index: String.Index = "abc".endIndex
	let _index1: String.Index = "abc".startIndex
	let _index2: String.Index = "abc".startIndex
	var _string: String = "abc"
	var _string1: String = "abc"
	let _string2: String = "abc"
	let _string3: String = "abc"
	let _character: Character = "a"
	let _substring: Substring = "abc".dropLast()
	let _range: Range<String.Index> = _string.startIndex..<_string.endIndex
	let _any: Any = "abc"
	let _anyType: _Any = _Any()
	let _optional: _Optional? = _Optional()
	let _double: Double = 0
	let _double1: Double = 0
	let _double2: Double = 0
	let _int: Int = 0
	let _int1: Int = 0
	let _int2: Int = 0
	let _dictionary: [_Hashable: Any] = [:]
	let _closure: (Any, Any) -> Any = { a, b in a }
	let _closure2: (Any) -> Any = { a in a }
	let _closure3: (Any) -> Bool = { _ in true }
	let _closure4: (_Optional) -> Any = { _ in true }
	let _closure5: (Character) -> Bool = { _ in true }
	let _closure6: (Any) -> Any? = { a in a }
	let _closure7: (_Comparable, _Comparable) -> Bool = { _, _ in true }

	// MARK: Declare the templates

	// System
	_ = print(_any)
	_ = "println(_any)"

	_ = print(_any, terminator: "")
	_ = "print(_any)"

	_ = fatalError(_string)
	_ = "println(\"Fatal error: ${_string}\"); exitProcess(-1)"

	_ = assert(_bool)
	_ = "assert(_bool)"

	// Darwin
	_ = sqrt(_double)
	_ = "Math.sqrt(_double)"

	// String
	_ = String(_anyType)
	_ = "_anyType.toString()"

	_ = _anyType.description
	_ = "_anyType.toString()"

	_ = _string.isEmpty
	_ = "_string.isEmpty()"

	_ = _string.count
	_ = "_string.length"

	_ = _string.first
	_ = "_string.firstOrNull()"

	_ = _string.last
	_ = "_string.lastOrNull()"

	_ = Double(_string)
	_ = "_string.toDouble()"

	_ = Float(_string)
	_ = "_string.toFloat()"

	_ = UInt64(_string)
	_ = "_string.toULong()"

	_ = Int64(_string)
	_ = "_string.toLong()"

	_ = Int(_string)
	_ = "_string.toIntOrNull()"

	_ = _string.dropLast()
	_ = "_string.dropLast(1)"

	_ = _string.dropLast(_int)
	_ = "_string.dropLast(_int)"

	_ = _string.dropFirst()
	_ = "_string.drop(1)"

	_ = _string.dropFirst(_int)
	_ = "_string.drop(_int)"

	_ = _string.drop(while: _closure5)
	_ = "_string.dropWhile _closure5"

	_ = _string.indices
	_ = "_string.indices"

	_ = _string.firstIndex(of: _character)!
	_ = "_string.indexOf(_character)"

	_ = _string.contains(where: _closure5)
	_ = "(_string.find _closure5 != null)"

	_ = _string.firstIndex(of: _character)
	_ = "_string.indexOrNull(_character)"

	_ = _string.prefix(_int)
	_ = "_string.substring(0, _int)"

	_ = _string.prefix(upTo: _index)
	_ = "_string.substring(0, _index)"

	_ = _string[_index...]
	_ = "_string.substring(_index)"

	_ = _string[..<_index]
	_ = "_string.substring(0, _index)"

	_ = _string[..._index]
	_ = "_string.substring(0, _index + 1)"

	_ = _string[_index1..<_index2]
	_ = "_string.substring(_index1, _index2)"

	_ = _string[_index1..._index2]
	_ = "_string.substring(_index1, _index2 + 1)"

	_ = String(_substring)
	_ = "_substring"

	_ = _string.endIndex
	_ = "_string.length"

	_ = _string.startIndex
	_ = "0"

	_ = _string.formIndex(before: &_index)
	_ = "_index -= 1"

	_ = _string.index(after: _index)
	_ = "_index + 1"

	_ = _string.index(before: _index)
	_ = "_index - 1"

	_ = _string.index(_index, offsetBy: _int)
	_ = "_index + _int"

	_ = _substring.index(_index, offsetBy: _int)
	_ = "_index + _int"

	_ = _string1.replacingOccurrences(of: _string2, with: _string3)
	_ = "_string1.replace(_string2, _string3)"

	_ = _string1.prefix(while: _closure5)
	_ = "_string1.takeWhile _closure5"

	_ = _string1.hasPrefix(_string2)
	_ = "_string1.startsWith(_string2)"

	_ = _string1.hasSuffix(_string2)
	_ = "_string1.endsWith(_string2)"

	_ = _range.lowerBound
	_ = "_range.start"

	_ = _range.upperBound
	_ = "_range.endInclusive"

	_ = Range<String.Index>(uncheckedBounds: (lower: _index1, upper: _index2))
	_ = "IntRange(_index1, _index2)"

	_ = _string1.append(_string2)
	_ = "_string1 += _string2"

	_ = _string.append(_character)
	_ = "_string += _character"

	_ = _string.capitalized
	_ = "_string.capitalize()"

	_ = _string.uppercased()
	_ = "_string.toUpperCase()"

	// Character
	_ = _character.uppercased()
	_ = "_character.toUpperCase()"

	// Array
	_ = _array.append(_any)
	_ = "_array.add(_any)"

	_ = _array.insert(_any, at: _int)
	_ = "_array.add(_int, _any)"

	_ = _arrayOfOptionals.append(nil)
	_ = "_arrayOfOptionals.add(null)"

	_ = _array1.append(contentsOf: _array2)
	_ = "_array1.addAll(_array2)"

	_ = _array1.append(contentsOf: _array3)
	_ = "_array1.addAll(_array3)"

	_ = _array.isEmpty
	_ = "_array.isEmpty()"

	_ = _strArray.joined(separator: _string)
	_ = "_strArray.joinToString(separator = _string)"

	_ = _strArray.joined()
	_ = "_strArray.joinToString(separator = \"\")"

	_ = _array.count
	_ = "_array.size"

	_ = _array.indices
	_ = "_array.indices"

	_ = _array.startIndex
	_ = "0"

	_ = _array.endIndex
	_ = "_array.size"

	_ = _array.index(after: _int)
	_ = "_int + 1"

	_ = _array.index(before: _int)
	_ = "_int - 1"

	_ = _array.first
	_ = "_array.firstOrNull()"

	_ = _array.first(where: _closure3)
	_ = "_array.find _closure3"

	_ = _array.last(where: _closure3)
	_ = "_array.findLast _closure3"

	_ = _array.last
	_ = "_array.lastOrNull()"

	_ = _array.prefix(while: _closure3)
	_ = "_array.takeWhile _closure3"

	_ = _array.removeFirst()
	_ = "_array.removeAt(0)"

	_ = _array.remove(at: _int)
	_ = "_array.removeAt(_int)"

	_ = _array.dropFirst()
	_ = "_array.drop(1)"

	_ = _array.dropLast()
	_ = "_array.dropLast(1)"

	_ = _array.map(_closure2)
	_ = "_array.map _closure2"

	_ = _array.flatMap(_closure6)
	_ = "_array.flatMap _closure6"

	_ = _array.compactMap(_closure2)
	_ = "_array.map _closure2.filterNotNull()"

	_ = _array.filter(_closure3)
	_ = "_array.filter _closure3"

	_ = _array.reduce(_any, _closure)
	_ = "_array.fold(_any) _closure"

	_ = zip(_array1, _array2)
	_ = "_array1.zip(_array2)"

	_ = _array.firstIndex(where: _closure3)
	_ = "_array.indexOfFirst _closure3"

	_ = _array.contains(where: _closure3)
	_ = "(_array.find _closure3 != null)"

	_ = _comparableArray.sorted()
	_ = "_comparableArray.sorted()"

	_ = _comparableArray.contains(_comparable)
	_ = "_comparableArray.contains(_comparable)"

	_ = _comparableArray.firstIndex(of: _comparable)
	_ = "_comparableArray.indexOf(_comparable)"

	// Dictionary
	_ = _dictionary.count
	_ = "_dictionary.size"

	_ = _dictionary.isEmpty
	_ = "_dictionary.isEmpty()"

	_ = _dictionary.map(_closure2)
	_ = "_dictionary.map _closure2"

	// Int
	_ = Int.max
	_ = "Int.MAX_VALUE"

	_ = Int.min
	_ = "Int.MIN_VALUE"

	_ = min(_int1, _int2)
	_ = "Math.min(_int1, _int2)"

	_ = _int1..._int2
	_ = "_int1.._int2"

	_ = _int1..<_int2
	_ = "_int1 until _int2"

	// Double
	_ = _double1..._double2
	_ = "(_double1).rangeTo(_double2)"

	// Optional
	_ = _optional.map(_closure4)
	_ = "_optional?.let _closure4"
}
