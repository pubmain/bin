# Extrn Scripting Api (as of v0.0.1)

# Globals

-   game (DataModel)
-   workspace
-   offsets

# Functions

## version

Returns the current version as a string

## wait

Sleeps for `n` seconds

## Vector3.new

Creates a new Vector3 with x, y, z (all optional)

## Vector2.new

Creates a new Vector2 with x, y (all optional)

# Instance methods

## Address

Returns the instance address in memory

## FindFirstChild

## FindFirstChildOfClass

## GetChildren

Returns an array of instances

## GetAttributes

Returns an array of attribute names (strings)

## Read

```lua
Instance:Read(offset: u64, return_type: "cstring" | "string" | "f32" | "bool" | "u8" | "u16" | "u32" | "u64" | "same for signed ints" | "Vector3" | "Vector2")
```

## Write

```lua
Instance:Read(offset: u64, return_type: "f32" | "f64" | "bool" | "u8" | "u16" | "u32" | "u64" | "same for signed ints" | "Vector3" | "Vector2", value)
```
