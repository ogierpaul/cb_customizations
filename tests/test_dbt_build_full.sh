repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"/dbt || exit

target="dev"

# Parse named arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -t|--target)
            target="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter: $1"
            exit 1
            ;;
    esac
done

dbt deps
dbt seed --target $target || exit 1
dbt build --target $target || exit 1