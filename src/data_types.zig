// Any data types that we are currently supporting in this implementation
// number after type is the number of bits

// Helper Types

pub const string = []const u8;

// Implementation Types
//
pub const Feature = enum(i64) {
    Unused = 0,
    Dictionary_Replacement = 1,
    Compressed_Body = 2,
};

pub const Null = struct {};

pub const List = struct {};

pub const LargeList = struct {};

pub const ListView = struct {};

pub const LargeListView = struct {};

pub const FixedSizeList = struct {
    list_size: i32,
};

// bit width restricted to 8, 16, 32, 64
pub const Int = struct {
    bit_width: i32,
    is_signed: bool,
};

pub const Precision = enum(i16) { Half, Single, Double };

pub const FloatingPoint = struct {
    precision: Precision,
};

pub const Utf8 = struct {};

pub const Binary = struct {};

pub const LargetUtf8 = struct {};

pub const LargeBinary = struct {};

pub const Utf8View = struct {};

pub const BinaryView = struct {};

pub const FixedSizeBinary = struct { byte_width: i32 };

pub const Bool = struct {};

pub const RunEndEncoded = struct {};

// bit width restricted to 8, 16, 32, 64
pub const Decimal = struct { precision: i32, scale: i32, bit_width: i32 = 128 };

pub const DateUnit = enum(i16) {
    Day,
    Millisecond,
};

pub const Date = struct {
    unit: DateUnit = .Millisecond,
};

pub const TimeUnit = enum(i16) { Second, Millisecond, Microsecond, Nanosecond };

pub const Time = struct {
    unit: TimeUnit = .Millisecond,
    bit_width: i32 = 32,
};

pub const Timestamp = struct {
    unit: TimeUnit,
    timezone: []pub const u8,
};

pub const IntervalUnit = enum {
    Year_Month,
    Day_Time,
    Month_Day_Nano,
};

pub const Interval = struct {
    unit: IntervalUnit,
};

pub const Duration = struct { unit: TimeUnit = .Millisecond };

pub const Map = struct {
    keys_sorted: bool,
};

pub const UnionMode = enum(i16) { Sparse = 0, Dense = 1 };

pub const Union = struct { mode: UnionMode, type_ids: []const i32 };

pub const DataType = enum {
    Null,
    Int,
    FloatingPoint,
    Binary,
    Utf8,
    Bool,
    Decimal,
    Date,
    Time,
    Timestamp,
    Interval,
    List,
    Struct_,
    Union,
    FixedSizeBinary,
    FixedSizeList,
    Map,
    Duration,
    LargeBinary,
    LargeUtf8,
    LargeList,
    RunEndEncoded,
    BinaryView,
    Utf8View,
    ListView,
    LargeListView,
};

pub const KeyValue = struct {
    key: string,
    value: string,
};

pub const DictionaryKind = enum(i16) { DenseArray };
pub const DictionaryEncoding = struct {
    id: i64,
    index_type: Int,
    is_ordered: bool,
    dictionary_kind: DictionaryKind,
};

pub const Field = struct {
    name: string,
    nullable: bool,
    type: DataType,
    dictionary: DictionaryEncoding,
    children: []Field,
    custom_metadata: []KeyValue,
};

pub const Endianness = enum(i16) { Little, Big };

pub const Buffer = struct {
    offset: i64,
    length: i64,
};

pub const Schema = struct { endianness: Endianness = .Little, fields: []Field, custom_metadata: []KeyValue, features: []Feature };
