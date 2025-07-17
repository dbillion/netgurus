#!/bin/bash

# .NET Version Switcher Script
# Usage: ./switch-dotnet.sh [version]
# Example: ./switch-dotnet.sh 8.0

VERSION=$1

case $VERSION in
    "3.1")
        echo "Warning: .NET 3.1 has ICU compatibility issues on this system"
        echo "Creating global.json for .NET 3.1.426..."
        cat > global.json << EOF
{
  "sdk": {
    "version": "3.1.426"
  }
}
EOF
        ;;
    "5.0")
        echo "Switching to .NET 5.0.408..."
        cat > global.json << EOF
{
  "sdk": {
    "version": "5.0.408"
  }
}
EOF
        ;;
    "6.0")
        echo "Switching to .NET 6.0.428..."
        cat > global.json << EOF
{
  "sdk": {
    "version": "6.0.428"
  }
}
EOF
        ;;
    "7.0")
        echo "Switching to .NET 7.0.404..."
        cat > global.json << EOF
{
  "sdk": {
    "version": "7.0.404"
  }
}
EOF
        ;;
    "8.0")
        echo "Switching to .NET 8.0.412..."
        cat > global.json << EOF
{
  "sdk": {
    "version": "8.0.412"
  }
}
EOF
        ;;
    "9.0")
        echo "Switching to .NET 9.0.203..."
        cat > global.json << EOF
{
  "sdk": {
    "version": "9.0.203"
  }
}
EOF
        ;;
    "remove" | "default")
        echo "Removing global.json - using latest .NET version..."
        rm -f global.json
        ;;
    "list")
        echo "Available .NET versions:"
        dotnet --list-sdks
        echo ""
        echo "Current version:"
        dotnet --version
        echo ""
        echo "Usage: $0 [3.1|5.0|6.0|7.0|8.0|9.0|list|remove]"
        exit 0
        ;;
    *)
        echo "Available .NET versions:"
        dotnet --list-sdks
        echo ""
        echo "Current version:"
        dotnet --version
        echo ""
        echo "Usage: $0 [3.1|5.0|6.0|7.0|8.0|9.0|list|remove]"
        echo ""
        echo "Examples:"
        echo "  $0 8.0    # Switch to .NET 8.0"
        echo "  $0 6.0    # Switch to .NET 6.0"
        echo "  $0 list   # Show available versions"
        echo "  $0 remove # Remove global.json and use latest"
        exit 1
        ;;
esac

if [ "$VERSION" != "list" ] && [ "$VERSION" != "remove" ] && [ "$VERSION" != "default" ]; then
    echo "Current .NET version:"
    dotnet --version 2>/dev/null || echo "Error: Version $VERSION may not be compatible with current system"
fi
