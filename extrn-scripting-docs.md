# Extrn Scripting Api (as of v0.0.1)

## Globals

-   game (DataModel)
-   workspace
-   wait (or just task.wait)
-   script (script identifier idk why its here 🤔)
-   tick, time (same as roblox)
-   version

## Libraries

### input

### task

-   Theres no synchronize, desynchronize and defer

[Roblox Documentation](https://create.roblox.com/docs/reference/engine/libraries/task)

## Instance

Check Roblox docs for the info about these

### Ported Roblox methods

-   FindFirstChild, GetChildren
-   FindFirstChildOfClass, GetService, FindService (all are the same under the
    hood)

### Ported Roblox fields

### Set & Get

-   Workspace.CurrentCamera
-   Humanoid.WalkSpeed, Humanoid.JumpPower, Humanoid.Sit
-   BasePart.Anchored, BasePart.CanCollide, BasePart.CanTouch,
    BasePart.Position, BasePart.Velocity, BasePart.Rotation,
    BasePart.Orientation
-   Player.Team

### Get

-   Player.Name, Player.DisplayName, Player.Character, Player.UserId

### Custom Methods

```lua
Instance:Primitive(): Address
```

```lua
Instance:Address(): Address
```

## Address

To create an `Address` object u have to call `Address.new(offset: u64)`

NOTE: Address Library must be enabled by the user to be allowed to be used

NOTE: Im talking about creating custom addresses, doing `Instance:Address()`
works fine

```lua
Address:Read(
    offset: u64,
    type: "cstring" | "string" | "f32" | "bool" |
          "u8" | "u16" | "u32" | "u64" | "same for signed ints" |
          "Vector3" | "Vector2"
    )
```

```lua
Address:Write(
    offset: u64,
    type: "f32" | "bool" |
          "u32" | "u64"  |
          "same for signed ints" |
          "Vector3" | "Vector2"
    ),
    value
)
```
