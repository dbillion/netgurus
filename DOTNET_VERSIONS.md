# .NET Multi-Version Setup Guide

## Installed .NET Versions

You now have the following .NET SDK versions installed:

- ✅ .NET 3.1.426 (Note: Has ICU compatibility issues)
- ✅ .NET 5.0.408
- ✅ .NET 6.0.428
- ✅ .NET 7.0.404
- ✅ .NET 8.0.412
- ✅ .NET 9.0.203 (Default)

## How to Switch Between .NET Versions

### Method 1: Using the provided script (Recommended)

Use the `switch-dotnet.sh` script:

```bash
# Show available versions
./switch-dotnet.sh list

# Switch to .NET 8.0
./switch-dotnet.sh 8.0

# Switch to .NET 6.0
./switch-dotnet.sh 6.0

# Switch to .NET 7.0
./switch-dotnet.sh 7.0

# Remove version pinning (use latest)
./switch-dotnet.sh remove
```

### Method 2: Manual global.json creation

Create a `global.json` file in your project directory:

```json
{
  "sdk": {
    "version": "8.0.412"
  }
}
```

### Method 3: Project-specific version

When creating a new project, you can specify the framework version:

```bash
# Create a .NET 6.0 project
dotnet new console --framework net6.0

# Create a .NET 8.0 project  
dotnet new console --framework net8.0

# Create a .NET 5.0 project
dotnet new console --framework net5.0
```

## Checking Current Version

```bash
# Check current SDK version
dotnet --version

# List all installed SDKs
dotnet --list-sdks

# List all installed runtimes
dotnet --list-runtimes
```

## Important Notes

1. **Global.json Priority**: .NET searches for `global.json` in the current directory and parent directories
2. **Version Compatibility**: Each .NET version has different features and compatibility
3. **ICU Issue**: .NET 3.1 has ICU library compatibility issues on this Ubuntu system
4. **Side-by-side**: Multiple .NET versions can coexist without conflicts

## Troubleshooting

### ICU Error (for .NET 3.1)
If you encounter ICU errors with .NET 3.1, you can either:
1. Use .NET 5.0+ (recommended)
2. Set the invariant globalization mode (limited functionality)

### Path Issues
If `dotnet` command is not found:
```bash
export PATH=$PATH:$HOME/.dotnet:/usr/share/dotnet
```

## Examples

### Create projects with different versions:

```bash
# .NET 8.0 Web API
./switch-dotnet.sh 8.0
dotnet new webapi -n MyWebApi

# .NET 6.0 Console App
./switch-dotnet.sh 6.0
dotnet new console -n MyConsoleApp

# .NET 9.0 Blazor App
./switch-dotnet.sh 9.0
dotnet new blazor -n MyBlazorApp
```
