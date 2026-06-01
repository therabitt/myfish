function bench --description "Benchmark a command (run N times, default 10)"
    if not set -q argv[1]
        echo "Usage: bench [N] <command...>"
        echo "Example: bench 20 sleep 0.1"
        return 1
    end

    set -l times 10
    if string match -qr '^\d+$' -- $argv[1]
        set times $argv[1]
        set -e argv[1]
    end

    if not set -q argv[1]
        echo "Error: No command specified"
        return 1
    end

    echo "  Benchmarking: $argv"
    echo "  Runs: $times"
    echo ""

    set -l total 0
    set -l min_time 999999999
    set -l max_time 0

    for i in (seq $times)
        set -l start (date +%s%N)
        eval $argv >/dev/null 2>&1
        set -l end_time (date +%s%N)
        set -l elapsed (math "$end_time - $start")
        set total (math "$total + $elapsed")

        # Track min/max
        test $elapsed -lt $min_time && set min_time $elapsed
        test $elapsed -gt $max_time && set max_time $elapsed

        printf "  Run %2d/%d: %dms\r" $i $times (math "$elapsed / 1000000")
    end

    echo ""
    set -l avg (math "$total / $times / 1000000")
    set -l total_ms (math "$total / 1000000")
    set -l min_ms (math "$min_time / 1000000")
    set -l max_ms (math "$max_time / 1000000")

    echo ""
    printf "  Total:   %dms\n" $total_ms
    printf "  Average: %dms\n" $avg
    printf "  Min:     %dms\n" $min_ms
    printf "  Max:     %dms\n" $max_ms
end
