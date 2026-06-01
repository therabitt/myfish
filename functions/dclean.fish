function dclean --description "Clean up Docker resources (containers, images, volumes)"
    command -v docker &>/dev/null; or begin
        echo "  Error: docker is not installed"
        return 1
    end

    echo "  🐳 Docker Cleanup"
    echo ""

    echo "  Removing stopped containers..."
    docker container prune -f 2>/dev/null

    echo ""
    echo "  Removing dangling images..."
    docker image prune -f 2>/dev/null

    echo ""
    echo "  Removing unused networks..."
    docker network prune -f 2>/dev/null

    if contains -- "--volumes" $argv
        echo ""
        echo "  Removing unused volumes..."
        docker volume prune -f 2>/dev/null
    end

    echo ""
    echo "  ✓ Docker cleanup complete"

    if not contains -- "--volumes" $argv
        echo "  Tip: use 'dclean --volumes' to also remove unused volumes"
    end
end
